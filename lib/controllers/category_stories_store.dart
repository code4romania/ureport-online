import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:ureport_ecaro/models/bookmark.dart' as bookmark;
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../services/category_article_service.dart';
import '../models/story.dart' as storyFull;
import 'package:ureport_ecaro/models/response_opinions.dart' as opinionsarray;

part 'category_stories_store.g.dart';

class CategoryStories = _CategoryStories with _$CategoryStories;

abstract class _CategoryStories with Store {
  final CategoryArticleService httpClient = CategoryArticleService();
  late int userId;
  _CategoryStories() {
    userId = SPUtil().getInt(SPUtil.KEY_USER_ID);
    getStoryReadCount();
  }

  List<Story>? _initialStoryList;
  List<Result>? initialCategoryList;

  @observable
  ObservableFuture<ObservableList<Result>>? categoryList;

  @observable
  Map<String, List<Result>>? categories;

  @observable
  int _selectedCategory = 0;

  @computed
  int get selectedCategory => _selectedCategory;

  @observable
  ObservableList<Story> stories = ObservableList<Story>();

  @observable
  ObservableFuture<ObservableList<storyFull.StoryItem>>? recentStories;

  @observable
  ObservableFuture<ObservableList<opinionsarray.Question>>? recentOpinions;

  @observable
  String? searchCategoryKeyword;

  @observable
  bool isStoryBookmarked = false;

  @observable
  ObservableList<BadgeMedal> badges = <BadgeMedal>[].asObservable();

  @observable
  bool badgesLoading = true;

  @observable
  bool bookmarksLoading = true;

  @observable
  bool hasFilter = false;

  @observable
  int storyReadCount = 0;

  @observable
  List<storyFull.StoryItem> bookMarks = <storyFull.StoryItem>[].asObservable();
  @observable
  List<storyFull.StoryItem> bookmarksFiltered =
      <storyFull.StoryItem>[].asObservable();

  @action
  Future getBookmarks() async {
    bookmarksLoading = true;
    bookMarks.removeWhere((element) => true);
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    var list = await fetchBookmarks();
    for (bookmark.Bookmark element in list) {
      var story = await httpClient
          .xgetStory("https://$baseApiUrl/api/v1/stories/${element.story!.id}");
      if (story != null) {
        bookMarks.add(story);
      }
    }
    bookmarksLoading = false;
  }

  @action
  Future<int> getStoryReadCount() async {
    return storyReadCount = await httpClient.getStoryReadCount(userId: userId);
  }

  @action
  void filterBookmarks(int index, String filter, String allText) {
    _selectedCategory = index;
    hasFilter = false;
    if (filter == allText) {
      bookmarksFiltered = bookMarks;
      return;
    }
    bookmarksFiltered = bookMarks.where((element) {
      var category = element.category?.name ?? "";
      return category.toLowerCase().contains(filter.toLowerCase());
    }).toList();
    hasFilter = true;
  }

  @action
  void setCategories(Map<String, List<Result>>? map, String allText) {
    categories = map;
    categories!.addAll({allText: []});
    final reverseM =
        LinkedHashMap.fromEntries(categories!.entries.toList().reversed);
    categories = reverseM;
  }

  @action
  Future getRecentStories() {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    return recentStories = ObservableFuture(
      httpClient
          .getRecentStories('https://$baseApiUrl/api/v1/stories/org/1?limit=2'),
    ).then((stories) => stories.asObservable());
  }

  @action
  Future<void> getBadges() async {
    final claimedBadges =
        (await httpClient.getClaimedMedals(userId: userId, orgId: 1))
            .asObservable();

    final allBadges = (await httpClient.getAllMedals(userId: userId, orgId: 1))
        .asObservable();

    // Filter out the claimed badges from all badges adding owned = true to the claimed ones
    allBadges.forEach((element) {
      if (claimedBadges.any((badge) => badge.badge_type?.id == element.id)) {
        badges.add(element.copyWith(owned: true));
      } else {
        badges.add(element.copyWith(owned: false));
      }
    });

    //Sort badges by owned, owned being first
    badges.sort((a, b) {
      if (a.owned! && !b.owned!) return -1;
      if (!a.owned! && b.owned!) return 1;
      return 0;
    });

    badgesLoading = false;
  }

  @action
  Future getRecentOpinions() =>
      recentOpinions = ObservableFuture(httpClient.getRecentOpinions(
              'https://ureport.in/api/v1/polls/org/13/featured/?limit=2'))
          .then((opinions) => opinions.asObservable());

  @action
  Future fetchCategories() {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    return categoryList = ObservableFuture(
      httpClient
          .getCategories(
              'https://$baseApiUrl/api/v1/categories/org/1/?limit=100')
          .then((categories) =>
              categories?.asObservable() ?? <Result>[].asObservable()),
    );
  }

  @action
  void setInitialStoryList(List<Story> stories) {
    this.stories = stories.asObservable();
    _initialStoryList = stories.asObservable();
  }

  @action
  void searchStory(String? keyword) {
    if (keyword == null || keyword.isEmpty) {
      stories = _initialStoryList!.asObservable();
      return;
    } else {
      stories = _initialStoryList!
          .where((story) =>
              story.title!.toLowerCase().startsWith(keyword.toLowerCase()))
          .toList()
          .asObservable();
    }
  }

  @action
  Future<List<bookmark.Bookmark>> fetchBookmarks() async {
    return await httpClient.getBookmarks(userId: userId).asObservable();
  }
}

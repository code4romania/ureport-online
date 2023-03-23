import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import '../services/category_article_service.dart';
import '../models/story.dart' as storyFull;
import 'package:ureport_ecaro/models/response_opinions.dart' as opinionsarray;

part 'category_stories_store.g.dart';

class CategoryStories = _CategoryStories with _$CategoryStories;

abstract class _CategoryStories with Store {
  final CategoryArticleService httpClient = CategoryArticleService();

  List<Story>? _initialStoryList;
  List<Result>? initialCategoryList;

  @observable
  ObservableFuture<ObservableList<Result>>? categoryList;

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

  @action
  Future getRecentStories() => recentStories = ObservableFuture(httpClient
          .getRecentStories('https://$baseApiUrl/api/v1/stories/org/1?limit=2'))
      .then((stories) => stories.asObservable());

  @action
  Future getRecentOpinions() =>
      recentOpinions = ObservableFuture(httpClient.getRecentOpinions(
              'https://ureport.in/api/v1/polls/org/13/featured/?limit=2'))
          .then((opinions) => opinions.asObservable());

  @action
  Future fetchCategories() => categoryList = ObservableFuture(httpClient
      .getCategories('https://$baseApiUrl/api/v1/categories/org/1/?limit=60')
      .then((categories) =>
          categories?.asObservable() ?? <Result>[].asObservable()));

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
}

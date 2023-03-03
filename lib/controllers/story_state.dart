import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story_long.dart';
import '../services/category_article_service.dart';
import '../models/story.dart' as storyFull;
import 'package:ureport_ecaro/models/response_opinions.dart' as opinionsarray;

part 'story_state.g.dart';

class StoryStore = _StoryStore with _$StoryStore;

abstract class _StoryStore with Store {
  final CategoryArticleService httpClient = CategoryArticleService();
  List<Story>? _initialStoryList;
  List<Result>? initialCategoryList;

  @observable
  ObservableFuture<ObservableList<Result>>? categoryList;

  @observable
  ObservableFuture<StoryLong>? story;

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
  Future getRecentStories() =>
      recentStories = ObservableFuture(httpClient.getRecentStories(
              'https://ureport.heroesof.tech/api/v1/stories/org/1?limit=2'))
          .then((stories) => stories.asObservable());

  @action
  Future getRecentOpinions() =>
      recentOpinions = ObservableFuture(httpClient.getRecentOpinions(
              'https://ureport.in/api/v1/polls/org/13/featured/?limit=2'))
          .then((opinions) => opinions.asObservable());

  @action
  Future fetchCategories() => categoryList = ObservableFuture(httpClient
      .getCategories('https://ureport.heroesof.tech/api/v1/categories/org/1')
      .then((categories) => categories.asObservable()));

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
  Future fetchStory(String id) => story = ObservableFuture(httpClient
              .getStory("https://ureport.heroesof.tech/api/v1/stories/$id"))
          .then(
        (story) {
          //   httpClient.getBookmarkStatus("https://ureport.heroesof.tech/api/v1/storybookmarks/story/${story.id}");
          return story;
        },
      );
}
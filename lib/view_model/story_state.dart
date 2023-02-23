import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/repository/network_service.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/model/category.dart';
import 'package:ureport_ecaro/view/screens/category_article_flow/model/story_long.dart';

part 'story_state.g.dart';

class StoryStore = _StoryStore with _$StoryStore;

abstract class _StoryStore with Store {
  final NetworkService httpClient = NetworkService();
  List<Story>? _initialList;

  @observable
  ObservableFuture<ObservableList<Result>>? categoryList;

  @observable
  ObservableFuture<StoryLong>? story;

  @observable
  ObservableList<Story> stories = ObservableList<Story>();

  @action
  Future fetchCategories() => categoryList = ObservableFuture(httpClient
      .getCategories('https://ureport.heroesof.tech/api/v1/categories/org/1')
      .then((categories) => categories.asObservable()));

  @action
  void setInitialList(List<Story> stories) {
    this.stories = stories.asObservable();
    _initialList = stories.asObservable();
  }

  @action
  void search(String? keyword) {
    if (keyword == null || keyword.isEmpty) {
      stories = _initialList!.asObservable();
      return;
    } else {
      stories = _initialList!
          .where((story) =>
              story.title!.toLowerCase().startsWith(keyword.toLowerCase()))
          .toList()
          .asObservable();
    }
  }

  @action
  Future fetchStory(String id) => story = ObservableFuture(httpClient
          .getStory("https://ureport.heroesof.tech/api/v1/stories/$id"))
      .then((story) => story);
}

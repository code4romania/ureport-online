import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/repository/network_service.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';

part 'story_state.g.dart';

class StoryStore = _StoryStore with _$StoryStore;

abstract class _StoryStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<StoryModel>? storiesList;

  @action
  Future fetchStories() => storiesList = ObservableFuture(httpClient
      .getStories('https://ureport.heroesof.tech/api/v1/stories/org/1/')
      .then((stories) => stories));

  void getStories() {
    fetchStories();
  }
}

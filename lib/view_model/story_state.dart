import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/repository/network_service.dart';
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';

part 'story_state.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<StoryModel>>? storiesList;

  @action
  Future fetchUsers() => storiesList = ObservableFuture(httpClient
      .getStories('https://ureport.heroesof.tech/api/v1/stories/org/1/')
      .then((users) => users));

  void getTheUsers() {
    fetchUsers();
  }
}

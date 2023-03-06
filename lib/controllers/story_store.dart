import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/models/story_long.dart';
import 'package:ureport_ecaro/services/story_service.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
part 'story_store.g.dart';

class StoryStore = _StoryStoreBase with _$StoryStore;

abstract class _StoryStoreBase with Store {
  late String token;
  late StoryService httpClient;
  late SPUtil spUtil;

  @observable
  bool isLoading = true;

  @observable
  bool isActionLoading = false;

  @observable
  StoryItem? story;

  @observable
  StoryLong? fetchedStory;

  @observable
  String storyId;

  _StoryStoreBase(
    this.storyId,
    this.story,
    this.httpClient,
    this.spUtil,
  ) {
    token = spUtil.getValue(SPUtil.KEY_AUTH_TOKEN);
    if (fetchedStory == null) {
      fetchStory(storyId);
    }

    // isStoryBookmarked(storyId.toString());
    // isStoryRead(storyId.toString());
    getStoryRating(storyId.toString());
  }

  @observable
  bool? isBookmarked;

  @observable
  int? rating;

  @observable
  bool? isRead;

  // Get story details

  @action
  Future<void> isStoryRead(String storyId) async =>
      isRead = await httpClient.getStoryReadStatus(
          "https://ureport.heroesof.tech/api/v1/storyreads/story/$storyId");

  @action
  Future<void> getStoryRating(String storyId) async =>
      rating = await httpClient.getStoryRating(
          "https://ureport.heroesof.tech/api/v1/storyratings/story/$storyId");

  @action
  Future<void> isStoryBookmarked(String storyId) async =>
      isBookmarked = await httpClient.getStoryBookmark(
        "https://ureport.heroesof.tech/api/v1/storybookmarks/story/$storyId",
      );

  @action
  Future fetchStory(String id) async => fetchedStory = await httpClient
          .getStory("https://ureport.heroesof.tech/api/v1/stories/$id")
          .then(
        (story) {
          isLoading = false;
          return story;
        },
      );

  // End of get story details

  // Actions about current story

  @action
  Future<void> addBookmark({required String storyId}) async {
    isActionLoading = true;
    // await httpClient.bookmarkStory(storyId: storyId);
    isBookmarked = true;
    isActionLoading = false;
  }

  Future<void> removeBookmark({required String storyId}) async {
    isActionLoading = true;
    // await httpClient.bookmarkStory(storyId: storyId);
    isBookmarked = false;
    isActionLoading = false;
  }

  @action
  Future<void> readStory({required String storyId}) async {
    isActionLoading = true;
    // await httpClient.readStory(storyId: storyId);
    isRead = true;
    isActionLoading = false;
  }

  @action
  Future<void> rateStory({required String storyId, required int rating}) async {
    isActionLoading = true;
    // await httpClient.rateStory(storyId: storyId, rating: rating);
    this.rating = rating;
    isActionLoading = false;
  }

  // End of actions about current story
}

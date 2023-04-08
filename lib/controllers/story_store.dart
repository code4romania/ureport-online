import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/models/story_long.dart';
import 'package:ureport_ecaro/services/story_service.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
part 'story_store.g.dart';

class StoryStore = _StoryStoreBase with _$StoryStore;

abstract class _StoryStoreBase with Store {
  late StoryService httpClient;
  late String token;
  late int userId;
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
  int storyId;

  @observable
  bool isBookmarked = false;

  @observable
  int rating = 0;

  @observable
  bool canShowRating = false;

  @observable
  bool alreadyRead = false;

  @observable
  bool readArticle = false;

  @observable
  bool finishedTimer = false;

  @observable
  bool scrolledToTheBottom = false;

  @observable
  bool hasClaimedBadge = false;

  Timer? timer;

  void cancelTimer() {
    timer?.cancel();
  }

  _StoryStoreBase(
    this.storyId,
    this.story,
    this.spUtil,
  ) {
    token = spUtil.getValue(SPUtil.KEY_AUTH_TOKEN);
    httpClient = StoryService(token: token);

    print("##### DEBUG STORY #####");
    print("Story id: $storyId");

    fetchUserId().then((_) {
      print("User id: $userId");
      if (fetchedStory == null) {
        fetchStory(storyId);
      }

      isStoryBookmarked(storyId);

      showRating(storyId: storyId);

      isStoryRead(storyId).then((_) {
        print("Story read: $alreadyRead");
        if (!alreadyRead) {
          print("Timer started");

          timer = Timer(const Duration(minutes: 2), () {
            timerFinished();
          });
        }
      });
    });
  }

  @action
  Future<void> fetchUserId() async {
    userId = spUtil.getInt(SPUtil.KEY_USER_ID);
  }

  // Get story details

  @action
  Future<void> isStoryRead(int storyId) async => alreadyRead =
      await httpClient.getStoryReadStatus(storyId: storyId, userId: userId);

  @action
  Future<void> getStoryRating(int storyId) async => rating =
      await httpClient.getStoryRating(storyId: storyId, userId: userId);

  @action
  Future<void> isStoryBookmarked(int storyId) async => isBookmarked =
      await httpClient.getStoryBookmarkStatus(storyId: storyId, userId: userId);

  @action
  Future fetchStory(int id) async {
    fetchedStory =
        await httpClient.getStory("https://$baseApiUrl/api/v1/stories/$id");
    isLoading = false;
  }

  // End of get story details

  // Actions about current story

  @action
  void timerFinished() {
    print("Timer finished");
    finishedTimer = true;
    markAsRead(storyId: storyId);
  }

  @action
  Future<void> markAsRead({required int storyId}) async {
    hasClaimedBadge =
        await httpClient.markAsRead(storyId: storyId, userId: userId);

    readArticle = true;
  }

  @action
  Future<void> addBookmark({required int storyId}) async {
    final result =
        await httpClient.addBookmark(storyId: storyId, userId: userId);
    if (result) isBookmarked = true;
  }

  Future<void> removeBookmark({required int storyId}) async {
    isActionLoading = true;
    final result =
        await httpClient.removeBookmark(storyId: storyId, userId: userId);
    if (result) isBookmarked = false;
    isActionLoading = false;
  }

  @action
  Future<void> rateStory({required int storyId, required int rating}) async {
    isActionLoading = true;

    final receivedRating = await httpClient.rateStory(
        storyId: storyId, userId: userId, rating: rating);
    this.rating = receivedRating;

    isActionLoading = false;
  }

  @action
  Future<void> showRating({required int storyId}) async {
    isActionLoading = true;
    final show = await httpClient.showRating(storyId: storyId);
    this.canShowRating = show;
    if (show) await getStoryRating(storyId);

    print("Can show rating: $canShowRating");
    print("Rating: $rating");

    isActionLoading = false;
  }

  // End of actions about current story
}

import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/story.dart';
import 'package:ureport_ecaro/models/story_long.dart';
import 'package:ureport_ecaro/services/story_service.dart';
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
  bool canFinishReading = false;

  @observable
  int storyId;

  @observable
  bool isBookmarked = false;

  @observable
  int rating = 0;

  @observable
  bool alreadyRead = false;

  @observable
  bool readArticle = false;

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
    userId = 3;
    if (fetchedStory == null) {
      fetchStory(storyId);
    }

    print("StoryStore: $storyId");

    isStoryBookmarked(storyId)
        .then((value) => print("is bookmarked: $isBookmarked"));

    isStoryRead(storyId).then((value) {
      print("is read: $alreadyRead");
      if (!alreadyRead) {
        print("Timer started");
        timer = Timer(const Duration(seconds: 10), () {
          timerFinished();
        });
      }
    });
    //getStoryRating(storyId.toString());
  }

  // Get story details

  @action
  Future<void> isStoryRead(int storyId) async => alreadyRead =
      await httpClient.getStoryReadStatus(storyId: storyId, userId: userId);

  @action
  Future<void> getStoryRating(int storyId) async => rating =
      (await httpClient.getStoryRating(storyId: storyId, userId: userId))!;

  @action
  Future<void> isStoryBookmarked(int storyId) async => isBookmarked =
      await httpClient.getStoryBookmarkStatus(storyId: storyId, userId: userId);

  @action
  Future fetchStory(int id) async => fetchedStory = await httpClient
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
  void timerFinished() {
    print("timer finished");
    markAsRead(storyId: storyId);
  }

  @action
  void finishReading() {
    print("finishReading");
    if (readArticle) canFinishReading = true;
  }

  @action
  Future<void> markAsRead({required int storyId}) async {
    final result =
        await httpClient.markAsRead(storyId: storyId, userId: userId);
    if (result != null) readArticle = true;
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
  Future<void> readStory({required String storyId}) async {
    isActionLoading = true;
    // await httpClient.readStory(storyId: storyId);
    alreadyRead = true;
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

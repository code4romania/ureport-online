// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoryStore on _StoryStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_StoryStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isActionLoadingAtom =
      Atom(name: '_StoryStoreBase.isActionLoading', context: context);

  @override
  bool get isActionLoading {
    _$isActionLoadingAtom.reportRead();
    return super.isActionLoading;
  }

  @override
  set isActionLoading(bool value) {
    _$isActionLoadingAtom.reportWrite(value, super.isActionLoading, () {
      super.isActionLoading = value;
    });
  }

  late final _$storyAtom =
      Atom(name: '_StoryStoreBase.story', context: context);

  @override
  StoryItem? get story {
    _$storyAtom.reportRead();
    return super.story;
  }

  @override
  set story(StoryItem? value) {
    _$storyAtom.reportWrite(value, super.story, () {
      super.story = value;
    });
  }

  late final _$fetchedStoryAtom =
      Atom(name: '_StoryStoreBase.fetchedStory', context: context);

  @override
  StoryLong? get fetchedStory {
    _$fetchedStoryAtom.reportRead();
    return super.fetchedStory;
  }

  @override
  set fetchedStory(StoryLong? value) {
    _$fetchedStoryAtom.reportWrite(value, super.fetchedStory, () {
      super.fetchedStory = value;
    });
  }

  late final _$storyIdAtom =
      Atom(name: '_StoryStoreBase.storyId', context: context);

  @override
  int get storyId {
    _$storyIdAtom.reportRead();
    return super.storyId;
  }

  @override
  set storyId(int value) {
    _$storyIdAtom.reportWrite(value, super.storyId, () {
      super.storyId = value;
    });
  }

  late final _$isBookmarkedAtom =
      Atom(name: '_StoryStoreBase.isBookmarked', context: context);

  @override
  bool get isBookmarked {
    _$isBookmarkedAtom.reportRead();
    return super.isBookmarked;
  }

  @override
  set isBookmarked(bool value) {
    _$isBookmarkedAtom.reportWrite(value, super.isBookmarked, () {
      super.isBookmarked = value;
    });
  }

  late final _$ratingAtom =
      Atom(name: '_StoryStoreBase.rating', context: context);

  @override
  int get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(int value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$canShowRatingAtom =
      Atom(name: '_StoryStoreBase.canShowRating', context: context);

  @override
  bool get canShowRating {
    _$canShowRatingAtom.reportRead();
    return super.canShowRating;
  }

  @override
  set canShowRating(bool value) {
    _$canShowRatingAtom.reportWrite(value, super.canShowRating, () {
      super.canShowRating = value;
    });
  }

  late final _$alreadyReadAtom =
      Atom(name: '_StoryStoreBase.alreadyRead', context: context);

  @override
  bool get alreadyRead {
    _$alreadyReadAtom.reportRead();
    return super.alreadyRead;
  }

  @override
  set alreadyRead(bool value) {
    _$alreadyReadAtom.reportWrite(value, super.alreadyRead, () {
      super.alreadyRead = value;
    });
  }

  late final _$readArticleAtom =
      Atom(name: '_StoryStoreBase.readArticle', context: context);

  @override
  bool get readArticle {
    _$readArticleAtom.reportRead();
    return super.readArticle;
  }

  @override
  set readArticle(bool value) {
    _$readArticleAtom.reportWrite(value, super.readArticle, () {
      super.readArticle = value;
    });
  }

  late final _$finishedTimerAtom =
      Atom(name: '_StoryStoreBase.finishedTimer', context: context);

  @override
  bool get finishedTimer {
    _$finishedTimerAtom.reportRead();
    return super.finishedTimer;
  }

  @override
  set finishedTimer(bool value) {
    _$finishedTimerAtom.reportWrite(value, super.finishedTimer, () {
      super.finishedTimer = value;
    });
  }

  late final _$scrolledToTheBottomAtom =
      Atom(name: '_StoryStoreBase.scrolledToTheBottom', context: context);

  @override
  bool get scrolledToTheBottom {
    _$scrolledToTheBottomAtom.reportRead();
    return super.scrolledToTheBottom;
  }

  @override
  set scrolledToTheBottom(bool value) {
    _$scrolledToTheBottomAtom.reportWrite(value, super.scrolledToTheBottom, () {
      super.scrolledToTheBottom = value;
    });
  }

  late final _$hasClaimedBadgeAtom =
      Atom(name: '_StoryStoreBase.hasClaimedBadge', context: context);

  @override
  bool get hasClaimedBadge {
    _$hasClaimedBadgeAtom.reportRead();
    return super.hasClaimedBadge;
  }

  @override
  set hasClaimedBadge(bool value) {
    _$hasClaimedBadgeAtom.reportWrite(value, super.hasClaimedBadge, () {
      super.hasClaimedBadge = value;
    });
  }

  late final _$fetchUserIdAsyncAction =
      AsyncAction('_StoryStoreBase.fetchUserId', context: context);

  @override
  Future<void> fetchUserId() {
    return _$fetchUserIdAsyncAction.run(() => super.fetchUserId());
  }

  late final _$isStoryReadAsyncAction =
      AsyncAction('_StoryStoreBase.isStoryRead', context: context);

  @override
  Future<void> isStoryRead(int storyId) {
    return _$isStoryReadAsyncAction.run(() => super.isStoryRead(storyId));
  }

  late final _$getStoryRatingAsyncAction =
      AsyncAction('_StoryStoreBase.getStoryRating', context: context);

  @override
  Future<void> getStoryRating(int storyId) {
    return _$getStoryRatingAsyncAction.run(() => super.getStoryRating(storyId));
  }

  late final _$isStoryBookmarkedAsyncAction =
      AsyncAction('_StoryStoreBase.isStoryBookmarked', context: context);

  @override
  Future<void> isStoryBookmarked(int storyId) {
    return _$isStoryBookmarkedAsyncAction
        .run(() => super.isStoryBookmarked(storyId));
  }

  late final _$fetchStoryAsyncAction =
      AsyncAction('_StoryStoreBase.fetchStory', context: context);

  @override
  Future<dynamic> fetchStory(int id) {
    return _$fetchStoryAsyncAction.run(() => super.fetchStory(id));
  }

  late final _$markAsReadAsyncAction =
      AsyncAction('_StoryStoreBase.markAsRead', context: context);

  @override
  Future<void> markAsRead({required int storyId}) {
    return _$markAsReadAsyncAction
        .run(() => super.markAsRead(storyId: storyId));
  }

  late final _$addBookmarkAsyncAction =
      AsyncAction('_StoryStoreBase.addBookmark', context: context);

  @override
  Future<void> addBookmark({required int storyId}) {
    return _$addBookmarkAsyncAction
        .run(() => super.addBookmark(storyId: storyId));
  }

  late final _$rateStoryAsyncAction =
      AsyncAction('_StoryStoreBase.rateStory', context: context);

  @override
  Future<void> rateStory({required int storyId, required int rating}) {
    return _$rateStoryAsyncAction
        .run(() => super.rateStory(storyId: storyId, rating: rating));
  }

  late final _$showRatingAsyncAction =
      AsyncAction('_StoryStoreBase.showRating', context: context);

  @override
  Future<void> showRating({required int storyId}) {
    return _$showRatingAsyncAction
        .run(() => super.showRating(storyId: storyId));
  }

  late final _$_StoryStoreBaseActionController =
      ActionController(name: '_StoryStoreBase', context: context);

  @override
  void timerFinished() {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.timerFinished');
    try {
      return super.timerFinished();
    } finally {
      _$_StoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isActionLoading: ${isActionLoading},
story: ${story},
fetchedStory: ${fetchedStory},
storyId: ${storyId},
isBookmarked: ${isBookmarked},
rating: ${rating},
canShowRating: ${canShowRating},
alreadyRead: ${alreadyRead},
readArticle: ${readArticle},
finishedTimer: ${finishedTimer},
scrolledToTheBottom: ${scrolledToTheBottom},
hasClaimedBadge: ${hasClaimedBadge}
    ''';
  }
}

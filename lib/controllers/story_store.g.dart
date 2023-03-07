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

  late final _$canFinishReadingAtom =
      Atom(name: '_StoryStoreBase.canFinishReading', context: context);

  @override
  bool get canFinishReading {
    _$canFinishReadingAtom.reportRead();
    return super.canFinishReading;
  }

  @override
  set canFinishReading(bool value) {
    _$canFinishReadingAtom.reportWrite(value, super.canFinishReading, () {
      super.canFinishReading = value;
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

  late final _$readStoryAsyncAction =
      AsyncAction('_StoryStoreBase.readStory', context: context);

  @override
  Future<void> readStory({required String storyId}) {
    return _$readStoryAsyncAction.run(() => super.readStory(storyId: storyId));
  }

  late final _$rateStoryAsyncAction =
      AsyncAction('_StoryStoreBase.rateStory', context: context);

  @override
  Future<void> rateStory({required String storyId, required int rating}) {
    return _$rateStoryAsyncAction
        .run(() => super.rateStory(storyId: storyId, rating: rating));
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
  void finishReading() {
    final _$actionInfo = _$_StoryStoreBaseActionController.startAction(
        name: '_StoryStoreBase.finishReading');
    try {
      return super.finishReading();
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
canFinishReading: ${canFinishReading},
storyId: ${storyId},
isBookmarked: ${isBookmarked},
rating: ${rating},
alreadyRead: ${alreadyRead},
readArticle: ${readArticle}
    ''';
  }
}

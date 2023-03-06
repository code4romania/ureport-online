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
  String get storyId {
    _$storyIdAtom.reportRead();
    return super.storyId;
  }

  @override
  set storyId(String value) {
    _$storyIdAtom.reportWrite(value, super.storyId, () {
      super.storyId = value;
    });
  }

  late final _$isBookmarkedAtom =
      Atom(name: '_StoryStoreBase.isBookmarked', context: context);

  @override
  bool? get isBookmarked {
    _$isBookmarkedAtom.reportRead();
    return super.isBookmarked;
  }

  @override
  set isBookmarked(bool? value) {
    _$isBookmarkedAtom.reportWrite(value, super.isBookmarked, () {
      super.isBookmarked = value;
    });
  }

  late final _$ratingAtom =
      Atom(name: '_StoryStoreBase.rating', context: context);

  @override
  int? get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(int? value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$isReadAtom =
      Atom(name: '_StoryStoreBase.isRead', context: context);

  @override
  bool? get isRead {
    _$isReadAtom.reportRead();
    return super.isRead;
  }

  @override
  set isRead(bool? value) {
    _$isReadAtom.reportWrite(value, super.isRead, () {
      super.isRead = value;
    });
  }

  late final _$isStoryReadAsyncAction =
      AsyncAction('_StoryStoreBase.isStoryRead', context: context);

  @override
  Future<void> isStoryRead(String storyId) {
    return _$isStoryReadAsyncAction.run(() => super.isStoryRead(storyId));
  }

  late final _$getStoryRatingAsyncAction =
      AsyncAction('_StoryStoreBase.getStoryRating', context: context);

  @override
  Future<void> getStoryRating(String storyId) {
    return _$getStoryRatingAsyncAction.run(() => super.getStoryRating(storyId));
  }

  late final _$isStoryBookmarkedAsyncAction =
      AsyncAction('_StoryStoreBase.isStoryBookmarked', context: context);

  @override
  Future<void> isStoryBookmarked(String storyId) {
    return _$isStoryBookmarkedAsyncAction
        .run(() => super.isStoryBookmarked(storyId));
  }

  late final _$fetchStoryAsyncAction =
      AsyncAction('_StoryStoreBase.fetchStory', context: context);

  @override
  Future<dynamic> fetchStory(String id) {
    return _$fetchStoryAsyncAction.run(() => super.fetchStory(id));
  }

  late final _$addBookmarkAsyncAction =
      AsyncAction('_StoryStoreBase.addBookmark', context: context);

  @override
  Future<void> addBookmark({required String storyId}) {
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
isRead: ${isRead}
    ''';
  }
}

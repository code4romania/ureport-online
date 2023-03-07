// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileInfoStore on _ProfileInfoStoreBase, Store {
  late final _$badgesLoadingAtom =
      Atom(name: '_ProfileInfoStoreBase.badgesLoading', context: context);

  @override
  bool get badgesLoading {
    _$badgesLoadingAtom.reportRead();
    return super.badgesLoading;
  }

  @override
  set badgesLoading(bool value) {
    _$badgesLoadingAtom.reportWrite(value, super.badgesLoading, () {
      super.badgesLoading = value;
    });
  }

  late final _$bookmarksLoadingAtom =
      Atom(name: '_ProfileInfoStoreBase.bookmarksLoading', context: context);

  @override
  bool get bookmarksLoading {
    _$bookmarksLoadingAtom.reportRead();
    return super.bookmarksLoading;
  }

  @override
  set bookmarksLoading(bool value) {
    _$bookmarksLoadingAtom.reportWrite(value, super.bookmarksLoading, () {
      super.bookmarksLoading = value;
    });
  }

  late final _$badgesAtom =
      Atom(name: '_ProfileInfoStoreBase.badges', context: context);

  @override
  ObservableList<BadgeMedal> get badges {
    _$badgesAtom.reportRead();
    return super.badges;
  }

  @override
  set badges(ObservableList<BadgeMedal> value) {
    _$badgesAtom.reportWrite(value, super.badges, () {
      super.badges = value;
    });
  }

  late final _$bookmarksAtom =
      Atom(name: '_ProfileInfoStoreBase.bookmarks', context: context);

  @override
  ObservableList<Bookmark> get bookmarks {
    _$bookmarksAtom.reportRead();
    return super.bookmarks;
  }

  @override
  set bookmarks(ObservableList<Bookmark> value) {
    _$bookmarksAtom.reportWrite(value, super.bookmarks, () {
      super.bookmarks = value;
    });
  }

  late final _$fetchBadgesAsyncAction =
      AsyncAction('_ProfileInfoStoreBase.fetchBadges', context: context);

  @override
  Future<void> fetchBadges() {
    return _$fetchBadgesAsyncAction.run(() => super.fetchBadges());
  }

  late final _$fetchBookmarksAsyncAction =
      AsyncAction('_ProfileInfoStoreBase.fetchBookmarks', context: context);

  @override
  Future<void> fetchBookmarks() {
    return _$fetchBookmarksAsyncAction.run(() => super.fetchBookmarks());
  }

  @override
  String toString() {
    return '''
badgesLoading: ${badgesLoading},
bookmarksLoading: ${bookmarksLoading},
badges: ${badges},
bookmarks: ${bookmarks}
    ''';
  }
}

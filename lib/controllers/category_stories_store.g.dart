// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStories on _CategoryStories, Store {
  Computed<int>? _$selectedCategoryComputed;

  @override
  int get selectedCategory => (_$selectedCategoryComputed ??= Computed<int>(
          () => super.selectedCategory,
          name: '_CategoryStories.selectedCategory'))
      .value;

  late final _$categoryListAtom =
      Atom(name: '_CategoryStories.categoryList', context: context);

  @override
  ObservableFuture<ObservableList<Result>>? get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableFuture<ObservableList<Result>>? value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_CategoryStories.categories', context: context);

  @override
  Map<String, List<Result>>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(Map<String, List<Result>>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$_selectedCategoryAtom =
      Atom(name: '_CategoryStories._selectedCategory', context: context);

  @override
  int get _selectedCategory {
    _$_selectedCategoryAtom.reportRead();
    return super._selectedCategory;
  }

  @override
  set _selectedCategory(int value) {
    _$_selectedCategoryAtom.reportWrite(value, super._selectedCategory, () {
      super._selectedCategory = value;
    });
  }

  late final _$storiesAtom =
      Atom(name: '_CategoryStories.stories', context: context);

  @override
  ObservableList<Story> get stories {
    _$storiesAtom.reportRead();
    return super.stories;
  }

  @override
  set stories(ObservableList<Story> value) {
    _$storiesAtom.reportWrite(value, super.stories, () {
      super.stories = value;
    });
  }

  late final _$recentStoriesAtom =
      Atom(name: '_CategoryStories.recentStories', context: context);

  @override
  ObservableFuture<ObservableList<storyFull.StoryItem>>? get recentStories {
    _$recentStoriesAtom.reportRead();
    return super.recentStories;
  }

  @override
  set recentStories(
      ObservableFuture<ObservableList<storyFull.StoryItem>>? value) {
    _$recentStoriesAtom.reportWrite(value, super.recentStories, () {
      super.recentStories = value;
    });
  }

  late final _$recentOpinionsAtom =
      Atom(name: '_CategoryStories.recentOpinions', context: context);

  @override
  ObservableFuture<ObservableList<opinionsarray.Question>>? get recentOpinions {
    _$recentOpinionsAtom.reportRead();
    return super.recentOpinions;
  }

  @override
  set recentOpinions(
      ObservableFuture<ObservableList<opinionsarray.Question>>? value) {
    _$recentOpinionsAtom.reportWrite(value, super.recentOpinions, () {
      super.recentOpinions = value;
    });
  }

  late final _$searchCategoryKeywordAtom =
      Atom(name: '_CategoryStories.searchCategoryKeyword', context: context);

  @override
  String? get searchCategoryKeyword {
    _$searchCategoryKeywordAtom.reportRead();
    return super.searchCategoryKeyword;
  }

  @override
  set searchCategoryKeyword(String? value) {
    _$searchCategoryKeywordAtom.reportWrite(value, super.searchCategoryKeyword,
        () {
      super.searchCategoryKeyword = value;
    });
  }

  late final _$isStoryBookmarkedAtom =
      Atom(name: '_CategoryStories.isStoryBookmarked', context: context);

  @override
  bool get isStoryBookmarked {
    _$isStoryBookmarkedAtom.reportRead();
    return super.isStoryBookmarked;
  }

  @override
  set isStoryBookmarked(bool value) {
    _$isStoryBookmarkedAtom.reportWrite(value, super.isStoryBookmarked, () {
      super.isStoryBookmarked = value;
    });
  }

  late final _$badgesAtom =
      Atom(name: '_CategoryStories.badges', context: context);

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

  late final _$badgesLoadingAtom =
      Atom(name: '_CategoryStories.badgesLoading', context: context);

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
      Atom(name: '_CategoryStories.bookmarksLoading', context: context);

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

  late final _$hasFilterAtom =
      Atom(name: '_CategoryStories.hasFilter', context: context);

  @override
  bool get hasFilter {
    _$hasFilterAtom.reportRead();
    return super.hasFilter;
  }

  @override
  set hasFilter(bool value) {
    _$hasFilterAtom.reportWrite(value, super.hasFilter, () {
      super.hasFilter = value;
    });
  }

  late final _$bookMarksAtom =
      Atom(name: '_CategoryStories.bookMarks', context: context);

  @override
  List<storyFull.StoryItem> get bookMarks {
    _$bookMarksAtom.reportRead();
    return super.bookMarks;
  }

  @override
  set bookMarks(List<storyFull.StoryItem> value) {
    _$bookMarksAtom.reportWrite(value, super.bookMarks, () {
      super.bookMarks = value;
    });
  }

  late final _$bookmarksFilteredAtom =
      Atom(name: '_CategoryStories.bookmarksFiltered', context: context);

  @override
  List<storyFull.StoryItem> get bookmarksFiltered {
    _$bookmarksFilteredAtom.reportRead();
    return super.bookmarksFiltered;
  }

  @override
  set bookmarksFiltered(List<storyFull.StoryItem> value) {
    _$bookmarksFilteredAtom.reportWrite(value, super.bookmarksFiltered, () {
      super.bookmarksFiltered = value;
    });
  }

  late final _$xGetBookmarksAsyncAction =
      AsyncAction('_CategoryStories.xGetBookmarks', context: context);

  @override
  Future<dynamic> xGetBookmarks() {
    return _$xGetBookmarksAsyncAction.run(() => super.xGetBookmarks());
  }

  late final _$getBadgesAsyncAction =
      AsyncAction('_CategoryStories.getBadges', context: context);

  @override
  Future<void> getBadges() {
    return _$getBadgesAsyncAction.run(() => super.getBadges());
  }

  late final _$fetchBookmarksAsyncAction =
      AsyncAction('_CategoryStories.fetchBookmarks', context: context);

  @override
  Future<List<bookmark.Bookmark>> fetchBookmarks() {
    return _$fetchBookmarksAsyncAction.run(() => super.fetchBookmarks());
  }

  late final _$_CategoryStoriesActionController =
      ActionController(name: '_CategoryStories', context: context);

  @override
  void filterBookmarks(int index, String filter, String allText) {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.filterBookmarks');
    try {
      return super.filterBookmarks(index, filter, allText);
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(Map<String, List<Result>>? map, String allText) {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.setCategories');
    try {
      return super.setCategories(map, allText);
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getRecentStories() {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.getRecentStories');
    try {
      return super.getRecentStories();
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getRecentOpinions() {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.getRecentOpinions');
    try {
      return super.getRecentOpinions();
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchCategories() {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.fetchCategories');
    try {
      return super.fetchCategories();
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialStoryList(List<Story> stories) {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.setInitialStoryList');
    try {
      return super.setInitialStoryList(stories);
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchStory(String? keyword) {
    final _$actionInfo = _$_CategoryStoriesActionController.startAction(
        name: '_CategoryStories.searchStory');
    try {
      return super.searchStory(keyword);
    } finally {
      _$_CategoryStoriesActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryList: ${categoryList},
categories: ${categories},
stories: ${stories},
recentStories: ${recentStories},
recentOpinions: ${recentOpinions},
searchCategoryKeyword: ${searchCategoryKeyword},
isStoryBookmarked: ${isStoryBookmarked},
badges: ${badges},
badgesLoading: ${badgesLoading},
bookmarksLoading: ${bookmarksLoading},
hasFilter: ${hasFilter},
bookMarks: ${bookMarks},
bookmarksFiltered: ${bookmarksFiltered},
selectedCategory: ${selectedCategory}
    ''';
  }
}

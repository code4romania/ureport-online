// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_stories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStories on _CategoryStories, Store {
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

  late final _$_CategoryStoriesActionController =
      ActionController(name: '_CategoryStories', context: context);

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
stories: ${stories},
recentStories: ${recentStories},
recentOpinions: ${recentOpinions},
searchCategoryKeyword: ${searchCategoryKeyword},
isStoryBookmarked: ${isStoryBookmarked}
    ''';
  }
}

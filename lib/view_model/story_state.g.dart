// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoryStore on _StoryStore, Store {
  late final _$categoryListAtom =
      Atom(name: '_StoryStore.categoryList', context: context);

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

  late final _$storyAtom = Atom(name: '_StoryStore.story', context: context);

  @override
  ObservableFuture<StoryLong>? get story {
    _$storyAtom.reportRead();
    return super.story;
  }

  @override
  set story(ObservableFuture<StoryLong>? value) {
    _$storyAtom.reportWrite(value, super.story, () {
      super.story = value;
    });
  }

  late final _$storiesAtom =
      Atom(name: '_StoryStore.stories', context: context);

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

  late final _$_StoryStoreActionController =
      ActionController(name: '_StoryStore', context: context);

  @override
  Future<dynamic> fetchCategories() {
    final _$actionInfo = _$_StoryStoreActionController.startAction(
        name: '_StoryStore.fetchCategories');
    try {
      return super.fetchCategories();
    } finally {
      _$_StoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInitialList(List<Story> stories) {
    final _$actionInfo = _$_StoryStoreActionController.startAction(
        name: '_StoryStore.setInitialList');
    try {
      return super.setInitialList(stories);
    } finally {
      _$_StoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search(String? keyword) {
    final _$actionInfo =
        _$_StoryStoreActionController.startAction(name: '_StoryStore.search');
    try {
      return super.search(keyword);
    } finally {
      _$_StoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> fetchStory(String id) {
    final _$actionInfo = _$_StoryStoreActionController.startAction(
        name: '_StoryStore.fetchStory');
    try {
      return super.fetchStory(id);
    } finally {
      _$_StoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryList: ${categoryList},
story: ${story},
stories: ${stories}
    ''';
  }
}

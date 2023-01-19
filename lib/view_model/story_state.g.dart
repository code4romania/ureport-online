// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoryStore on _StoryStore, Store {
  late final _$storiesListAtom =
      Atom(name: '_StoryStore.storiesList', context: context);

  @override
  ObservableFuture<StoryModel>? get storiesList {
    _$storiesListAtom.reportRead();
    return super.storiesList;
  }

  @override
  set storiesList(ObservableFuture<StoryModel>? value) {
    _$storiesListAtom.reportWrite(value, super.storiesList, () {
      super.storiesList = value;
    });
  }

  late final _$_StoryStoreActionController =
      ActionController(name: '_StoryStore', context: context);

  @override
  Future<dynamic> fetchStories() {
    final _$actionInfo = _$_StoryStoreActionController.startAction(
        name: '_StoryStore.fetchStories');
    try {
      return super.fetchStories();
    } finally {
      _$_StoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
storiesList: ${storiesList}
    ''';
  }
}

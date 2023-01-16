// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$storiesListAtom =
      Atom(name: '_UserStore.storiesList', context: context);

  @override
  ObservableFuture<List<StoryModel>>? get storiesList {
    _$storiesListAtom.reportRead();
    return super.storiesList;
  }

  @override
  set storiesList(ObservableFuture<List<StoryModel>>? value) {
    _$storiesListAtom.reportWrite(value, super.storiesList, () {
      super.storiesList = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  Future<dynamic> fetchUsers() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.fetchUsers');
    try {
      return super.fetchUsers();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
storiesList: ${storiesList}
    ''';
  }
}

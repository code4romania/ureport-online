// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$showQuizComponentAtom =
      Atom(name: '_HomeStore.showQuizComponent', context: context);

  @override
  bool get showQuizComponent {
    _$showQuizComponentAtom.reportRead();
    return super.showQuizComponent;
  }

  @override
  set showQuizComponent(bool value) {
    _$showQuizComponentAtom.reportWrite(value, super.showQuizComponent, () {
      super.showQuizComponent = value;
    });
  }

  @override
  String toString() {
    return '''
showQuizComponent: ${showQuizComponent}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StateStore on _StateStoreBase, Store {
  late final _$selectedLanguageAtom =
      Atom(name: '_StateStoreBase.selectedLanguage', context: context);

  @override
  String? get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(String? value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_StateStoreBase.isLoading', context: context);

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

  late final _$newLanguageAtom =
      Atom(name: '_StateStoreBase.newLanguage', context: context);

  @override
  String? get newLanguage {
    _$newLanguageAtom.reportRead();
    return super.newLanguage;
  }

  @override
  set newLanguage(String? value) {
    _$newLanguageAtom.reportWrite(value, super.newLanguage, () {
      super.newLanguage = value;
    });
  }

  late final _$loggedInAtom =
      Atom(name: '_StateStoreBase.loggedIn', context: context);

  @override
  bool? get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool? value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  @override
  String toString() {
    return '''
selectedLanguage: ${selectedLanguage},
isLoading: ${isLoading},
newLanguage: ${newLanguage},
loggedIn: ${loggedIn}
    ''';
  }
}

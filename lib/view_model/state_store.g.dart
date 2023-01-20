// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StateStore on _StateStoreBase, Store {
  late final _$localeAtom =
      Atom(name: '_StateStoreBase.locale', context: context);

  @override
  Locale? get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale? value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

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

  late final _$_StateStoreBaseActionController =
      ActionController(name: '_StateStoreBase', context: context);

  @override
  void setLocale(Locale locale) {
    final _$actionInfo = _$_StateStoreBaseActionController.startAction(
        name: '_StateStoreBase.setLocale');
    try {
      return super.setLocale(locale);
    } finally {
      _$_StateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale},
selectedLanguage: ${selectedLanguage},
loggedIn: ${loggedIn}
    ''';
  }
}

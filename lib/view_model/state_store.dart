import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'state_store.g.dart';

class StateStore = _StateStoreBase with _$StateStore;

abstract class _StateStoreBase with Store {
  @observable
  Locale? locale;

  List<String> languages = [
    'Română',
    'Ucraineană',
  ];

  @observable
  String? selectedLanguage = "Română";

  @action
  void setLocale(Locale locale) => locale = locale;

  @observable
  bool? loggedIn;
}

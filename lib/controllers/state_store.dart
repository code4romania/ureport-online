import 'package:mobx/mobx.dart';

part 'state_store.g.dart';

class StateStore = _StateStoreBase with _$StateStore;

abstract class _StateStoreBase with Store {
  _StateStoreBase() {
    selectedLanguage = "ro";
  }

  @observable
  String? selectedLanguage;

  @observable
  String? newLanguage;

  Map<String, String> languages = {
    'ro': "Română (RO)",
    'uk': "Ucraineană (UK)",
  };

  @observable
  bool? loggedIn;
}

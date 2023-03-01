import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

part 'state_store.g.dart';

class StateStore = _StateStoreBase with _$StateStore;

abstract class _StateStoreBase with Store {
  _StateStoreBase() {
    selectedLanguage = "ro";
  }

  @observable
  String? selectedLanguage;

  @action
  void changeLanguage(String language) {
    SPUtil().setValue(SPUtil.KEY_USER_LANGUAGE, language);
    selectedLanguage = language;
  }

  @observable
  bool isLoading = true;

  @observable
  String? newLanguage;

  Map<String, String> languages = {
    'ro': "Română (RO)",
    'uk': "Ucraineană (UK)",
  };

  @observable
  bool? loggedIn;
}

import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

part 'state_store.g.dart';

class StateStore = _StateStoreBase with _$StateStore;

abstract class _StateStoreBase with Store {
  _StateStoreBase() {
    String savedLanguage = SPUtil().getValue(SPUtil.KEY_USER_LANGUAGE);
    if (savedLanguage.isEmpty) {
      selectedLanguage = "ro";
    } else {
      selectedLanguage = savedLanguage;
    }
    changeLanguage(selectedLanguage ?? 'ro');
  }

  Logger _log = Logger();

  @observable
  String? selectedLanguage;

  @action
  void changeLanguage(String language) {
    SPUtil().setValue(SPUtil.KEY_USER_LANGUAGE, language);

    SPUtil().setValue(
        SPUtil.API_BASE_URL,
        apiBasUrl.entries
            .firstWhere((element) => element.key == language)
            .value);
    SPUtil().setValue(
        SPUtil.SHARE_OPINION_URL,
        shareOpinionUrl.entries
            .firstWhere((element) => element.key == language)
            .value);
    SPUtil().setValue(
        SPUtil.SHARE_STORY_URL,
        shareStoryUrl.entries
            .firstWhere((element) => element.key == language)
            .value);
    _log.d('''
        LANGUAGE SET TO: $language
        API_BASE_URL: ${SPUtil().getValue(SPUtil.API_BASE_URL)}
        SHARE_OPINION_URL: ${SPUtil().getValue(SPUtil.SHARE_OPINION_URL)}
        SHARE_STORY_URL: ${SPUtil().getValue(SPUtil.SHARE_STORY_URL)}''');
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
  Map<String, String> apiBasUrl = {
    'ro': 'ro.ureport.unicef-staging.heroesof.tech',
    'uk': 'uk.ureport.unicef-staging.heroesof.tech',
  };
  Map<String, String> shareOpinionUrl = {
    'ro': 'https://ro.ureport.unicef-staging.heroesof.tech/opinion',
    'uk': 'https://uk.ureport.unicef-staging.heroesof.tech/opinion',
  };
  Map<String, String> shareStoryUrl = {
    'ro': 'https://ro.ureport.unicef-staging.heroesof.tech/story',
    'uk': 'https://uk.ureport.unicef-staging.heroesof.tech/story',
  };

  @observable
  bool? loggedIn;

  @observable
  Profile? profile;

  @action
  void updateProfile(Profile? value) => profile = value;
}

import 'package:mobx/mobx.dart';
import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/services/profile_info_services.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
part 'profile_info_store.g.dart';

class ProfileInfoStore = _ProfileInfoStoreBase with _$ProfileInfoStore;

abstract class _ProfileInfoStoreBase with Store {
  late ProfileInfoServices httpClient;
  late String token;
  late int userId;
  late SPUtil spUtil;

  _ProfileInfoStoreBase(
    this.spUtil,
  ) {
    token = spUtil.getValue(SPUtil.KEY_AUTH_TOKEN);
    httpClient = ProfileInfoServices(token: token);
    userId = spUtil.getInt(SPUtil.KEY_USER_ID);

    fetchBadges();
    fetchBookmarks();
  }

  @observable
  bool badgesLoading = true;

  @observable
  bool bookmarksLoading = true;

  @observable
  ObservableList<BadgeMedal> badges = <BadgeMedal>[].asObservable();

  @observable
  ObservableList<Bookmark> bookmarks = <Bookmark>[].asObservable();

  @action
  Future<void> fetchBadges() async {
    badges =
        (await httpClient.getMedals(userId: userId, orgId: 1)).asObservable();
    badgesLoading = false;
  }

  @action
  Future<void> fetchBookmarks() async {
    bookmarks = (await httpClient.getBookmarks(userId: userId)).asObservable();
    bookmarksLoading = false;
  }
}

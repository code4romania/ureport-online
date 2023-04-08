import 'dart:developer';

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

    getBadges();
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
  Future<void> getBadges() async {
    final claimedBadges =
        (await httpClient.getClaimedMedals(userId: userId, orgId: 1))
            .asObservable();

    final allBadges = (await httpClient.getAllMedals(userId: userId, orgId: 1))
        .asObservable();

    // Filter out the claimed badges from all badges adding owned = true to the claimed ones
    allBadges.forEach((element) {
      if (claimedBadges.any((badge) => badge.badge_type?.id == element.id)) {
        badges.add(element.copyWith(owned: true));
      } else {
        badges.add(element.copyWith(owned: false));
      }
    });

    //Sort badges by owned, owned being first
    badges.sort((a, b) {
      if (a.owned! && !b.owned!) return -1;
      if (!a.owned! && b.owned!) return 1;
      return 0;
    });

    badgesLoading = false;
  }

  @action
  Future<void> fetchBookmarks() async {
    bookmarks = (await httpClient.getBookmarks(userId: userId)).asObservable();
    bookmarksLoading = false;
  }
}

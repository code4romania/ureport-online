import 'dart:convert';

import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/models/claimed_badge.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

class ProfileInfoServices {
  late Map<String, String> header;

  ProfileInfoServices({required String? token}) {
    header = {
      "Authorization": "Token $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<List<ClaimedBadge>> getClaimedMedals({
    required int userId,
    required int orgId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse(
          "https://$baseApiUrl/api/v1/userbadges/user/$userId/?org=$orgId"),
      headers: header,
    );

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      final List<ClaimedBadge> medals =
          body.map((dynamic item) => ClaimedBadge.fromJson(item)).toList();
      return medals;
    } else {
      return [];
    }
  }

  Future<List<BadgeMedal>> getAllMedals({
    required int userId,
    required int orgId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse(
          "https://$baseApiUrl/api/v1/userbadges/user/$userId/all/?org=$orgId"),
      headers: header,
    );

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      final List<BadgeMedal> medals =
          body.map((dynamic item) => BadgeMedal.fromJson(item)).toList();
      return medals;
    } else {
      return [];
    }
  }

  Future<List<Bookmark>> getBookmarks({
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse("https://$baseApiUrl/api/v1/storybookmarks/user/$userId/"),
      headers: header,
    );
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
      final List<Bookmark> bookmarks =
          body.map((dynamic item) => Bookmark.fromJson(item)).toList();
      return bookmarks;
    } else {
      return [];
    }
  }
}

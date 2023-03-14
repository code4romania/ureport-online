import 'dart:convert';

import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/models/profile.dart';

class ProfileInfoServices {
  late Map<String, String> header;

  ProfileInfoServices({required String? token}) {
    header = {
      "Authorization": "Token $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<List<BadgeMedal>> getMedals({
    required int userId,
    required int orgId,
  }) async {
    final response = await http.get(
      Uri.parse(
          "https://ureport.heroesof.tech/api/v1/userbadges/user/$userId/?org=$orgId"),
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
    final response = await http.get(
      Uri.parse(
          "https://ureport.heroesof.tech/api/v1/storybookmarks/user/$userId/"),
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

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/claimed_badge.dart';
import 'package:ureport_ecaro/models/response_opinions.dart' as opinionsarray;
import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../models/story.dart' as storyFull;

class CategoryArticleService {
  late Map<String, String> header;

  CategoryArticleService() {
    header = {
      "Authorization": "Token ${SPUtil().getValue(SPUtil.KEY_AUTH_TOKEN)}",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }
  Future<List<Result>?> getCategories(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final category =
            Category.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

        return category.results ?? [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<storyFull.StoryItem>> getRecentStories(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final stories = storyFull.Story.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        return stories.results ?? [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<opinionsarray.Question>> getRecentOpinions(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final opinions = opinionsarray.ResponseOpinions.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
      if (opinions.results.length > 0)
        return opinions.results[0].questions;
      else
        return [];
    } else {
      return [];
    }
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
    Logger log = Logger();

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

  Future<int> getStoryReadCount({required int userId}) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse('https://$baseApiUrl/api/v1/storyreads/user/$userId/'),
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
      final List<dynamic> storyes = jsonResponse;

      return storyes.length;
    } else {
      return 0;
    }
  }

  Future<storyFull.StoryItem?> xgetStory(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final story = storyFull.StoryItem.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));
        return story;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

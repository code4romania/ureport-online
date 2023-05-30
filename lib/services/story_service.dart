import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

import '../models/story_long.dart' as storyLong;

class StoryService {
  late Map<String, String> header;

  StoryService({required String? token}) {
    header = {
      "Authorization": "Token $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<storyLong.StoryLong?> getStory(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final story = storyLong.StoryLong.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes)));

        return story;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<int> getStoryReadCount({required int userId}) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse('https://$baseApiUrl/api/v1/storyreads/user/$userId/'),
      headers: header,
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> storyes = jsonResponse;

      return storyes.length;
    } else {
      return 0;
    }
  }

  Future<bool> getStoryReadStatus({
    required int storyId,
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse(
          "https://$baseApiUrl/api/v1/storyreads/user/$userId/?story=$storyId"),
      headers: header,
    );
    if (response.statusCode == 200) {
      if (response.body == "[]")
        return false;
      else
        return true;
    } else {
      return false;
    }
  }

  Future<String> markAsRead({
    required int storyId,
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.post(
      Uri.https("$baseApiUrl", "/api/v1/storyreads/user/$userId/"),
      headers: header,
      body: jsonEncode({
        "story": storyId,
      }),
    );

    print(response.body);
    if (response.statusCode == 201 || response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (response.body == "[]") return '';
      if (decodedResponse == "[]") return '';
      if (decodedResponse == null) return '';
      if (response.body.isEmpty) return '';

      // claimed badge if response is not empty and not null and not empty list []
      String badgeTitle = decodedResponse[0]['badge_type']['title'];
      return badgeTitle;
    } else {
      return '';
    }
  }

  Future<int> getStoryRating({
    required int storyId,
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse(
        "https://$baseApiUrl/api/v1/storyratings/user/$userId/?story=$storyId",
      ),
      headers: header,
    );

    if (response.statusCode == 200) {
      if (response.body == "[]") return 0;
      final rating = jsonDecode(response.body)[0]["score"];
      return rating;
    } else {
      return 0;
    }
  }

  Future<bool> showRating({
    required int storyId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
        Uri.parse("https://$baseApiUrl/api/v1/storysettings/story/$storyId/"));

    if (response.statusCode == 200) {
      if (response.body == "[]") return false;
      final show = jsonDecode(response.body)["display_rating"] == true;
      return show;
    } else {
      return false;
    }
  }

  Future<int> rateStory({
    required int storyId,
    required int userId,
    required int rating,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.post(
        Uri.https("$baseApiUrl", "/api/v1/storyratings/user/$userId/"),
        headers: header,
        body: jsonEncode({
          "story": storyId,
          "score": rating,
        }));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return rating;
    } else {
      return 0;
    }
  }

  //Bookmark

  Future<bool> getStoryBookmarkStatus({
    required int storyId,
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.get(
      Uri.parse(
          "https://$baseApiUrl/api/v1/storybookmarks/user/$userId/?story=$storyId"),
      headers: header,
    );
    if (response.statusCode == 200) {
      if (response.body == "[]")
        return false;
      else
        return true;
    } else {
      return false;
    }
  }

  Future<bool> addBookmark({
    required int storyId,
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.post(
      Uri.https("$baseApiUrl", "/api/v1/storybookmarks/user/$userId/"),
      headers: header,
      body: jsonEncode({
        "story": storyId,
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeBookmark({
    required int storyId,
    required int userId,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.delete(
      Uri.https("$baseApiUrl", "/api/v1/storybookmarks/user/$userId/"),
      headers: header,
      body: jsonEncode({
        "story": storyId.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

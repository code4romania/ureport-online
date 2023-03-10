import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/models/claimed_badge.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../models/story_long.dart' as storyLong;
import '../models/story.dart' as storyFull;

class StoryService {
  late Map<String, String> header;

  StoryService({required String? token}) {
    header = {
      "Authorization": "Token $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<storyLong.StoryLong> getStory(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final story = storyLong.StoryLong.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
      return story;
    } else {
      return storyLong.StoryLong();
    }
  }

  Future<bool> getStoryReadStatus({
    required int storyId,
    required int userId,
  }) async {
    final response = await http.get(
      Uri.parse(
          "https://ureport.heroesof.tech/api/v1/storyreads/user/$userId/?story=$storyId"),
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

  Future<bool> markAsRead({
    required int storyId,
    required int userId,
  }) async {
    final response = await http.post(
      Uri.https("ureport.heroesof.tech", "/api/v1/storyreads/user/$userId/"),
      headers: header,
      body: jsonEncode({
        "story": storyId,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // convert the response which is a list of ClaimedBadges into an object getting the first element from json
      // final ClaimedBadge claimedBadge =
      //     ClaimedBadge.fromJson(jsonDecode(utf8.decode(response.bodyBytes))[0]);

      return true;
    } else {
      return false;
    }
  }

  Future<int> getStoryRating({
    required int storyId,
    required int userId,
  }) async {
    final response = await http.get(Uri.parse(
        "https://ureport.heroesof.tech/api/v1/storyratings/user/$userId/?story=$storyId"));
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
    final response = await http.get(Uri.parse(
        "https://ureport.heroesof.tech/api/v1/storysettings/story/$storyId/"));

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
    final response = await http.post(
        Uri.https(
            "ureport.heroesof.tech", "/api/v1/storyratings/user/$userId/"),
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
    final response = await http.get(
      Uri.parse(
          "https://ureport.heroesof.tech/api/v1/storybookmarks/user/$userId/?story=$storyId"),
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
    final response = await http.post(
      Uri.https(
          "ureport.heroesof.tech", "/api/v1/storybookmarks/user/$userId/"),
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
    final response = await http.delete(
      Uri.https(
          "ureport.heroesof.tech", "/api/v1/storybookmarks/user/$userId/"),
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

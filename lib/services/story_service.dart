import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/category.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';
import '../models/story_long.dart' as storyLong;
import '../models/story.dart' as storyFull;

class StoryService {
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

  Future<bool> getStoryReadStatus(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<int?> getStoryRating(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return 4;
    } else {
      return 4;
    }
  }

  Future<bool> getStoryBookmark(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> readStory({required String storyId}) async {}

  Future<void> rateStory(
      {required String storyId, required int rating}) async {}

  Future<void> bookmarkStory({required String storyId}) async {}
}

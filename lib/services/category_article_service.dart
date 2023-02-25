import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/category.dart';
import '../models/story_long.dart' as storyLong;

class CategoryArticleService {
  Future<List<Result>> getCategories(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //  final StoryModel story = StoryModel.fromJson(jsonDecode(response.body));
      final category =
          Category.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return category.results ?? [];
    } else {
      return [];
    }
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
}

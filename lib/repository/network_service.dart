import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';

class NetworkService {
  Future<StoryModel> getStories(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //  final StoryModel story = StoryModel.fromJson(jsonDecode(response.body));
      return StoryModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return StoryModel();
    }
  }
}

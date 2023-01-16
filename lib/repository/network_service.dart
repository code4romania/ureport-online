import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/view/screens/articles/article/model/story.dart';

class NetworkService {
  List<StoryModel> stories = [];

  Future getStories(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      stories = (data['data']).map((json) {
        return StoryModel.fromJson(json);
      }).toList();
      return stories;
    } else {
      print("Error in URL");
    }
  }
}

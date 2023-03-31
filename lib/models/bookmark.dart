// To parse this JSON data, do
//
//     final bookmark = bookmarkFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
class Bookmark with _$Bookmark {
  const factory Bookmark({
    int? id,
    int? user,
    Story? story,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}

@freezed
class Story with _$Story {
  const factory Story({
    int? id,
    String? title,
    bool? featured,
    String? summary,
    dynamic videoId,
    dynamic audioLink,
    dynamic tags,
    int? org,
    List<String>? images,
    DateTime? created_on,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

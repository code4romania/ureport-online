// To parse this JSON data, do
//
//     final storyLong = storyLongFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_long.freezed.dart';
part 'story_long.g.dart';

@freezed
class StoryLong with _$StoryLong {
  const factory StoryLong({
    int? id,
    String? title,
    bool? featured,
    String? summary,
    String? content,
    String? written_by,
    dynamic videoId,
    dynamic audioLink,
    dynamic tags,
    int? org,
    List<dynamic>? images,
    Category? category,
    DateTime? createdOn,
  }) = _StoryLong;

  factory StoryLong.fromJson(Map<String, dynamic> json) =>
      _$StoryLongFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    dynamic imageUrl,
    String? name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

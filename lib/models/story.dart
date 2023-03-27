// To parse this JSON data, do
//
//     final story = storyFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    int? count,
    String? next,
    dynamic previous,
    List<StoryItem>? results,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@freezed
class StoryItem with _$StoryItem {
  const factory StoryItem({
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
  }) = _Result;

  factory StoryItem.fromJson(Map<String, dynamic> json) =>
      _$StoryItemFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    dynamic? imageUrl,
    String? name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

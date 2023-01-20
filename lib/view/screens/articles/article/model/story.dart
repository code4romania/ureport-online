// To parse this JSON data, do
//
//     final storyModel = storyModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'story.freezed.dart';
part 'story.g.dart';

StoryModel storyModelFromJson(String str) =>
    StoryModel.fromJson(json.decode(str));

String storyModelToJson(StoryModel data) => json.encode(data.toJson());

@freezed
class StoryModel with _$StoryModel {
  const factory StoryModel({
    int? count,
    dynamic? next,
    dynamic? previous,
    List<Result>? results,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? title,
    bool? featured,
    String? summary,
    String? content,
    String? videoId,
    dynamic? audioLink,
    String? tags,
    int? org,
    List<String>? images,
    Category? category,
    DateTime? createdOn,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
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

// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    int? count,
    dynamic next,
    dynamic previous,
    List<Result>? results,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? imageUrl,
    String? name,
    DateTime? createdOn,
    DateTime? modifiedOn,
    List<Story>? stories,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Story with _$Story {
  const factory Story({
    int? id,
    String? title,
    bool? featured,
    String? summary,
    String? videoId,
    dynamic audioLink,
    String? tags,
    int? org,
    List<dynamic>? images,
    DateTime? createdOn,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

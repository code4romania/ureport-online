// To parse this JSON data, do
//
//     final badgeMedal = badgeMedalFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge_medal.freezed.dart';
part 'badge_medal.g.dart';

@freezed
class BadgeMedal with _$BadgeMedal {
  const factory BadgeMedal({
    int? id,
    BadgeType? badge_type,
    int? user,
    DateTime? offered_on,
  }) = _BadgeMedal;

  factory BadgeMedal.fromJson(Map<String, dynamic> json) =>
      _$BadgeMedalFromJson(json);
}

@freezed
class BadgeType with _$BadgeType {
  const factory BadgeType({
    int? id,
    int? org,
    String? title,
    String? image,
    String? description,
    dynamic item_category,
  }) = _BadgeType;

  factory BadgeType.fromJson(Map<String, dynamic> json) =>
      _$BadgeTypeFromJson(json);
}

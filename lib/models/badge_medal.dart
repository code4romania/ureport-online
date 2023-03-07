// To parse this JSON data, do
//
//     final badgeMedal = badgeMedalFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'badge_medal.freezed.dart';
part 'badge_medal.g.dart';

@freezed
class BadgeMedal with _$BadgeMedal {
  const factory BadgeMedal({
    int? id,
    BadgeType? badgeType,
    int? user,
    DateTime? offeredOn,
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
    int? itemCategory,
  }) = _BadgeType;

  factory BadgeType.fromJson(Map<String, dynamic> json) =>
      _$BadgeTypeFromJson(json);
}

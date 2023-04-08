// To parse this JSON data, do
//
//     final claimedBadge = claimedBadgeFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'claimed_badge.freezed.dart';
part 'claimed_badge.g.dart';

@freezed
class ClaimedBadge with _$ClaimedBadge {
  const factory ClaimedBadge({
    int? id,
    BadgeType? badge_type,
    int? user,
    DateTime? offered_on,
  }) = _ClaimedBadge;

  factory ClaimedBadge.fromJson(Map<String, dynamic> json) =>
      _$ClaimedBadgeFromJson(json);
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

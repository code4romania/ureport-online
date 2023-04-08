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
    int? org,
    String? title,
    String? image,
    String? description,
    int? validationCategory,
    bool? owned,
  }) = _BadgeMedal;

  factory BadgeMedal.fromJson(Map<String, dynamic> json) =>
      _$BadgeMedalFromJson(json);
}

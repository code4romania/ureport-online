// To parse this JSON data, do
//
//     final badgeMedal = badgeMedalFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'response.freezed.dart';
part 'response.g.dart';

@freezed
class Response with _$Response {
  const factory Response({
    int? statusCode,
    String? message,
    dynamic data,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ureport_ecaro/locator/locator.dart';
import 'package:ureport_ecaro/repository/network_operation/http_service.dart';

import 'api_response.dart';

import 'network_operation/apicall_responsedata/response_contact_creation.dart';
import 'network_operation/apicall_responsedata/response_single_contact.dart';
import 'network_operation/apicall_responsedata/response_startflow.dart';
import 'package:http/http.dart' as http;

class RapidProService {
  var _httpService = locator<HttpService>();

  Future<ApiResponse<ResponseContactCreation>> createContact(
    String urn,
    String fcmtoken,
    String name, {
    @required onSuccess(String uuid)?,
    @required onError(Exception error)?,
  }) async {
    var apiResponse = await _httpService.postRequesturlencoded(
        "https://app.rapidpro.io/c/fcm/604e94cd-fcd1-42ec-93d8-a77696dd18ac/receive",
        data: {
          "urn": urn,
          "fcm_token": fcmtoken,
          "name": name,
        },
        isurlEncoded: true);
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: ResponseContactCreation.fromJson(apiResponse.data.data));
  }

  sendMessage(
      {@required String? message,
      @required onSuccess(value)?,
      @required onError(Exception value)?,
      urn,
      fcmToken}) async {
    //TODO: CHANGE CHANNEL ID LINE 49
    await _httpService.postRequesturlencoded(
      "https://app.rapidpro.io/c/fcm/604e94cd-fcd1-42ec-93d8-a77696dd18ac/receive",
      data: {"from": urn, "fcm_token": fcmToken, "msg": message},
    ).then((value) {
      print("success: ${value.data}");
      onSuccess!(value.data);
    });
  }
}

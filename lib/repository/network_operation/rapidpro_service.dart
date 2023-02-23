import 'package:flutter/material.dart';
import 'package:ureport_ecaro/locator/locator.dart';
import 'api_response.dart';
import 'apicall_responsedata/response_contact_creation.dart';
import 'http_service.dart';

class RapidProService {
  var _httpService = locator<HttpService>();

  final String _rapidProUrl = "rapidpro.heroesof.tech";
  final String _channelId = "0692108c-cc60-4700-96e6-202af3131cc3";

  Future<ApiResponse<ResponseContactCreation>> createContact(
    String urn,
    String fcmtoken,
    String name, {
    @required onSuccess(String uuid)?,
    @required onError(Exception error)?,
  }) async {
    var apiResponse = await _httpService.postRequesturlencoded(
        "https://$_rapidProUrl/c/fcm/$_channelId/register",
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
    await _httpService.postRequesturlencoded(
      "https://$_rapidProUrl/c/fcm/$_channelId/receive",
      data: {"from": urn, "fcm_token": fcmToken, "msg": message},
    ).then((value) {
      onSuccess!(value.data);
    });
  }
}

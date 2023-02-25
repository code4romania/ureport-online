import 'dart:convert';
import 'package:ureport_ecaro/models/response_opinions.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

import '../locator/locator.dart';
import '../models/api_response.dart';
import 'network_operation/http_service.dart';
import '../models/response_opinions.dart' as quistionlist;

class OpinionRepository {
  var _httpService = locator<HttpService>();
  var spservice = locator<SPUtil>();
  var sp = locator<SPUtil>();

  Future<ApiResponse<ResponseOpinions>> getOpinions(String url) async {
    var apiResponse = await _httpService.getRequest(url);
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: ResponseOpinions.fromJson(apiResponse.data.data));
  }

  Future<ApiResponse<List<quistionlist.Question>>> getOpinionQuestions(
      questionListFromLocal) async {
    final mapdata = jsonDecode(questionListFromLocal);

    List<quistionlist.Question> d = (mapdata as List)
        .map((e) => quistionlist.Question.fromJson(e))
        .toList();

    return ApiResponse(httpCode: 200, message: "success", data: d);
  }
}

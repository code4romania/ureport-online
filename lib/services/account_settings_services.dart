import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/response.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

class AccountSettingsServices {
  late Map<String, String> header;

  AccountSettingsServices({required String? token}) {
    header = {
      "Authorization": "Token $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<Response> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
    required int userID,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.post(
      Uri.https(
        baseApiUrl,
        "/api/v1/userprofiles/user/$userID/password/",
      ),
      headers: header,
      body: jsonEncode({
        "current_password": currentPassword,
        "new_password": newPassword,
        "new_password2": passwordConfirmation
      }),
    );

    return Response(
      statusCode: response.statusCode,
      message: jsonDecode(response.body)["detail"],
      data: response.statusCode == 200 ? true : false,
    );
  }

  Future<Response> updateUsername({
    required int userID,
    required String username,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    final response = await http.patch(
      Uri.https(
        baseApiUrl,
        "/api/v1/userprofiles/user/$userID/",
      ),
      headers: header,
      body: jsonEncode({
        "full_name": username,
      }),
    );

    print(header);
    print(response.body);

    return Response(
      statusCode: response.statusCode,
      message: jsonDecode(response.body)["detail"],
      data: response.statusCode == 200 ? jsonDecode(response.body) : null,
    );
  }

  Future<Response> updateProfilePicture({
    required int userID,
    required String path,
  }) async {
    final String baseApiUrl = SPUtil().getValue(SPUtil.API_BASE_URL);
    var uri = Uri.https(baseApiUrl, "api/v1/userprofiles/user/$userID/image/");

    var req = http.MultipartRequest('PUT', uri)
      ..files.add(await http.MultipartFile.fromPath('image', path));
    req.headers['Content-Type'] = 'multipart/form-data';
    req.headers['accept'] = 'application/json';
    req.headers['Authorization'] = header["Authorization"]!;
    var response = await req.send();

    final respStr = await response.stream.bytesToString();

    print(header);
    print(respStr);

    return Response(
      statusCode: response.statusCode,
      message: response.reasonPhrase ?? "",
      data: jsonDecode(respStr),
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/models/response.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

class AuthService {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
        Uri.https(
          baseApiUrl,
          "/api/v1/get-auth-token/",
        ),
        body: {
          "username": email,
          "password": password,
        });

    if (response.statusCode == 200) {
      await getAuthToken(
        email: email,
        password: password,
      );
    }

    return Response(
      statusCode: response.statusCode,
      message: jsonDecode(response.body)["detail"],
      data:
          response.statusCode == 200 ? LoginStatus.SUCCESS : LoginStatus.ERROR,
    );
  }

  Future<Response> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http
        .post(Uri.https(baseApiUrl, "/api/v1/userprofiles/signup/"), body: {
      "full_name": name,
      "email": email,
      "password": password,
    });

    if (response.statusCode == 200) {
      await getAuthToken(
        email: email,
        password: password,
      );
    }
    return Response(
      statusCode: response.statusCode,
      message: jsonDecode(response.body)["detail"],
      data: response.statusCode == 200
          ? RegisterStatus.SUCCESS
          : RegisterStatus.ERROR,
    );
  }

  Future<Response> sendCode({
    required String email,
  }) async {
    final response = await http
        .post(Uri.https(baseApiUrl, "/api/v1/userprofiles/forgot/"), body: {
      "email": email,
    });

    print(response.body);

    return Response(
      statusCode: response.statusCode,
      message: response.statusCode != 200
          ? null
          : jsonDecode(response.body)["detail"],
      data: response.statusCode == 200
          ? ForgotPasswordStatus.SUCCESS
          : ForgotPasswordStatus.ERROR,
    );
  }

  Future<Response> verifyCode({
    required String email,
    required String code,
  }) async {
    final response = await http.post(
        Uri.https(baseApiUrl, "/api/v1/userprofiles/forgot/check/"),
        body: {
          "email": email,
          "code": code,
        });

    print(response.body);

    return Response(
      statusCode: response.statusCode,
      message: jsonDecode(response.body)["detail"],
      data: response.statusCode == 200
          ? ForgotPasswordStatus.SUCCESS
          : ForgotPasswordStatus.ERROR,
    );
  }

  Future<Response> resetPassword({
    required String email,
    required String code,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    final response = await http.post(
        Uri.https(baseApiUrl, "/api/v1/userprofiles/forgot/check/"),
        body: {
          "email": email,
          "code": code,
          "new_password": newPassword,
          "new_password2": confirmNewPassword,
        });
    print(response.body);

    return Response(
      statusCode: response.statusCode,
      message: response.statusCode == 200
          ? jsonDecode(response.body)["detail"]
          : "OK",
      data: response.statusCode == 200
          ? ForgotPasswordStatus.SUCCESS
          : ForgotPasswordStatus.ERROR,
    );
  }

  Future<void> getAuthToken({
    required String email,
    required String password,
  }) async {
    final response = await http
        .post(Uri.https(baseApiUrl, "/api/v1/get-auth-token/"), body: {
      "username": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      final int id = jsonDecode(response.body)['id'];
      SPUtil().setValue(SPUtil.KEY_AUTH_TOKEN, token);
      SPUtil().setInt(SPUtil.KEY_USER_ID, id);
    }
  }

  Future<Profile?> getProfile() async {
    final token = SPUtil().getValue(SPUtil.KEY_AUTH_TOKEN);

    final response = await http.get(
      Uri.https(baseApiUrl, "/api/v1/userprofiles/user/@me/"),
      headers: {
        "Authorization": "Token $token",
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final profile = Profile.fromJson(jsonDecode(response.body));
      SPUtil().setInt(SPUtil.KEY_USER_ID, profile.id);
      return profile;
    } else {
      return null;
    }
  }
}

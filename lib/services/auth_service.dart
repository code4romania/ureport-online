import 'dart:convert';

import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/utils/constants.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/utils/sp_utils.dart';

class AuthService {
  Future<LoginStatus?> login({
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
      final String token = jsonDecode(response.body)['token'];
      SPUtil().setValue(SPUtil.KEY_AUTH_TOKEN, token);

      await getProfile();
      return LoginStatus.SUCCESS;
    } else {
      return LoginStatus.ERROR;
    }
  }

  Future<RegisterStatus?> register({
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
      final String token = jsonDecode(response.body)['token'];

      SPUtil().setValue(SPUtil.KEY_AUTH_TOKEN, token);

      await getProfile();

      return RegisterStatus.SUCCESS;
    } else {
      return RegisterStatus.ERROR;
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

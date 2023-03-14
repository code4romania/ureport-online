import 'dart:convert';

import 'package:ureport_ecaro/models/profile.dart';
import 'package:ureport_ecaro/utils/enums.dart';
import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/utils/sp_utils.dart';

class AuthService {
  Future<LoginStatus?> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
        Uri.parse(
          "https://ureport.heroesof.tech/api/v1/get-auth-token/",
        ),
        body: {
          "username": email,
          "password": password,
        });

    print(response.body);
    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      SPUtil().setValue(SPUtil.KEY_AUTH_TOKEN, token);
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
    final response = await http.post(
        Uri.https("ureport.heroesof.tech", "/api/v1/userprofiles/signup/"),
        body: {
          "full_name": name,
          "email": email,
          "password": password,
        });

    print(response.body);

    if (response.statusCode == 200) {
      final String token = jsonDecode(response.body)['token'];
      final int userId = jsonDecode(response.body)['id'];

      SPUtil().setValue(SPUtil.KEY_AUTH_TOKEN, token);
      SPUtil().setInt(SPUtil.KEY_AUTH_TOKEN, userId);

      return RegisterStatus.SUCCESS;
    } else {
      return RegisterStatus.ERROR;
    }
  }

  Future<Profile?> getProfile() async {
    final token = SPUtil().getValue(SPUtil.KEY_AUTH_TOKEN);

    final response = await http.get(
        Uri.https("ureport.heroesof.tech", "/api/v1/userprofiles/user/@me/"),
        headers: {
          "Authorization": "Token $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      final profile = Profile.fromJson(jsonDecode(response.body));
      SPUtil().setInt(SPUtil.KEY_USER_ID, 3);
      return profile;
    } else {
      return null;
    }
  }
}

import 'dart:convert';

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
}

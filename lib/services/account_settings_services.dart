import 'dart:convert';

import 'package:ureport_ecaro/models/badge_medal.dart';
import 'package:http/http.dart' as http;
import 'package:ureport_ecaro/models/bookmark.dart';
import 'package:ureport_ecaro/utils/constants.dart';

class AccountSettingsServices {
  late Map<String, String> header;

  AccountSettingsServices({required String? token}) {
    header = {
      "Authorization": "Token $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
    required int userID,
  }) async {
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
    print(response.body);
    print(userID);
    print(header["Authorization"]);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

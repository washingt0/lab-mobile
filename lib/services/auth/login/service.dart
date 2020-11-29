import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import 'model.dart';

/// tries to perform login
class LoginService {
  /// constructor
  LoginService();

  /// form username and password
  String username, password;

  /// tries to perform login
  Future<String> performLogin() async {
    final http.Response res = await http.post(
      '$baseURL/iam/auth/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(LoginRequest(username, password).toJson()),
    );

    if (res.statusCode >= 400) {
      throw Exception(
          'Was not possible to validate the credentials with the server');
    }

    final LoginResponse resp = LoginResponse.fromJson(json.decode(res.body));

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String token = '${resp.kind} ${resp.token}';

    await prefs.setString('jwt', token);

    return token;
  }
}

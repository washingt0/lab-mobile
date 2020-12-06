import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

part 'model.g.dart';

/// user session
@JsonSerializable()
class Session {
  /// constructor
  Session();

  /// construct session from json
  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  /// unique session's identifier
  @JsonKey(name: 'jti')
  String sessionID;

  /// unique user's identifier
  @JsonKey(name: 'sub')
  String userID;

  /// user name
  @JsonKey(name: 'user_name')
  String userName;

  /// username
  String username;

  /// session's expiration date
  @JsonKey(name: 'exp')
  int expiresAt;

  /// check with server if session still valid
  Future<Session> checkSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String token = prefs.getString('jwt');

    if (token == null || token == '') {
      throw Exception('No token found');
    }

    final http.Response resp = await http.get(
      '$baseURL/iam/auth/session',
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (resp.statusCode != 200) {
      throw Exception('Invalid Session');
    }

    final Session sess = Session.fromJson(json.decode(resp.body));

    await prefs.setInt('expiresAt', sess.expiresAt);
    await prefs.setString('userName', sess?.userName);
    await prefs.setString('username', sess?.username);
    await prefs.setString('sessionID', sess?.sessionID);
    await prefs.setString('userID', sess?.userID);

    return sess;
  }
}

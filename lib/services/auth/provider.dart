import 'package:flutter/material.dart';

import 'session/model.dart';

/// provides auth-related changes/data
class AuthProvider with ChangeNotifier {
  Session _session;

  /// restore && check session with backend
  Future<Session> loadSession() async =>
      _session = await Session().checkSession();

  /// returns a session
  Session getSession() => _session;
}

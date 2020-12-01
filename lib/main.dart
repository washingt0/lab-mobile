import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login/login.dart';
import 'pages/router.dart';
import 'services/auth/provider.dart';
import 'services/auth/session/model.dart';
import 'theme.dart';

void main() {
  runApp(ChangeNotifierProvider<AuthProvider>(
    create: (BuildContext context) => AuthProvider(),
    child: MyApp(),
  ));
}

/// my app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'LAB',
        theme: appTheme,
        home: FutureBuilder<Session>(
          future: Provider.of<AuthProvider>(context).loadSession(),
          builder: (BuildContext context, AsyncSnapshot<Session> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                print(snapshot.error);
              }
              if (snapshot.data == null || snapshot.data.sessionID == null) {
                return LoginPage();
              } else {
                return PageRouter();
              }
            }
            return Container();
          },
        ),
      );
}

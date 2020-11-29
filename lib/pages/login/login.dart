import 'package:flutter/material.dart';

import '../../services/auth/login/service.dart';
import '../main/main.dart';

/// login page
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Card(
            child: Column(
              children: <Widget>[_buildForm(context, _formKey)],
            ),
          ),
        ),
      );
}

Widget _buildForm(BuildContext context, GlobalKey<FormState> key) {
  final LoginService serv = LoginService();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Form(
      key: key,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (String value) {
              if (value == null || value.length < 4) {
                return 'Username must be at least 4 characters long';
              }

              return null;
            },
            onSaved: (String value) {
              serv.username = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (String value) {
              if (value == null || value.length < 8) {
                return 'Password must be at least 8 characters long';
              }

              return null;
            },
            onSaved: (String value) {
              serv.password = value;
            },
          ),
          RaisedButton(
            onPressed: () {
              if (!key.currentState.validate()) {
                return;
              }

              key.currentState.save();

              serv.performLogin().then((String tk) {
                if (tk == null || tk == '') {
                  throw Exception(tk);
                }
                Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => MainPage()));
              }).catchError((Object e) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => const AlertDialog(
                        title: Text('Não foi possivel fazer o login')));
              });
            },
          )
        ],
      ),
    ),
  );
}

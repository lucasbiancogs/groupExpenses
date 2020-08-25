import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  void login() {
    final Auth auth = Provider.of<Auth>(context, listen: false);

    auth.login(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 400,
        width: 350,
        child: Center(
          child: RaisedButton(
            child: Text('Entrar'),
            onPressed: login,
          ),
        ),
      ),
    );
  }
}

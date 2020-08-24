import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Center(
      child: RaisedButton(
        child: Text('Entrar'),
        onPressed: () => auth.login(context),
      ),
    );
  }
}

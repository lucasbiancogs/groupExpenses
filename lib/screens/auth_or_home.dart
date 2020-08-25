import 'package:flutter/material.dart';
import 'package:groupExpenses/screens/authenticated_user_screen.dart';
import 'package:provider/provider.dart';

import 'auth_screen.dart';
import 'authenticated_user_screen.dart';
import '../providers/auth.dart';

class AuthOrHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).primaryColor),
            ),
          );
        } else if (snapshot.error != null) {
          return Center(
            child: Text('Ops. Ocorreu um erro na aplicação'),
          );
        } else {
          return auth.isAuth ? AuthenticatedUserScreen() : AuthScreen();
        }
      },
    );
  }
}

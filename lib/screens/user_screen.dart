import 'package:flutter/material.dart';

import '../providers/user.dart';
import '../components/main_card.dart';

class UserScreen extends StatelessWidget {
  final User _user;

  UserScreen(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário ${_user.id}'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MainCard(_user.total),
          ],
        ),
      ),
    );
  }
}

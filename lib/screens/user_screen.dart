import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/user.dart';
import '../components/user_main_card.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário ${user.name}'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            UserMainCard(user),
            RaisedButton(
              child: Text('Teste'),
              onPressed: auth.loadUser,
            )
          ],
        ),
      ),
    );
  }
}

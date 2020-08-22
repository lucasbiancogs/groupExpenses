import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/group.dart';
import '../providers/auth.dart';
import '../providers/user.dart';
import '../components/user_main_card.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final user = Provider.of<User>(context);
    final group = Provider.of<Group>(context);
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
              child: Text('Carregar usuário'),
              onPressed: auth.loadUser,
            ),
            RaisedButton(
              child: Text('Teste'),
              onPressed: auth.teste,
            ),
            RaisedButton(
              child: Text('Carregar grupos'),
              onPressed: group.loadGroup,
            ),
          ],
        ),
      ),
    );
  }
}

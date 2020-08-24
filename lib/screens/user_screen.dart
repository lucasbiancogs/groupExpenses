import 'package:flutter/material.dart';
import 'package:groupExpenses/components/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
// import '../components/user_main_card.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário ${auth.name}'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // UserMainCard(),
            RaisedButton(
              child: Text('Carregar usuário'),
              onPressed: auth.loadUserAuth,
            ),
            RaisedButton(
              child: Text('Teste'),
              onPressed: auth.teste,
            ),
            RaisedButton(
              child: Text('Carregar grupos'),
              onPressed: auth.loadGroups,
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:groupExpenses/components/user_card.dart';

import '../components/group_main_card.dart';
import '../providers/group.dart';

class GroupScreen extends StatelessWidget {
  final Group _group;

  GroupScreen(this._group);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário ${_group.id}'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GroupMainCard(_group.total),
            Container(
              height: 300,
              child: ListView(
                children: _group.users.map((user) {
                  return UserCard(user);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:groupExpenses/providers/group.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    final group = Provider.of<GroupProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: ListTile(
        onTap: () {
          // Navegar para a tela user_screen
        },
        leading: CircleAvatar(
          radius: 30,
          child: Text(user.name),
        ),
        title: Container(
          height: 15,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.grey[200],
              ),
              FractionallySizedBox(
                // Inserir porcentagem correta
                widthFactor: 0.7,
                // Cor correta
                child: Container(color: Colors.green),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: 100,
          child: Text(
            group.groupId,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

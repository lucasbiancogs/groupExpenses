import 'package:flutter/material.dart';
import 'package:groupExpenses/providers/group.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    final group = Provider.of<Group>(context);

    bool widthFactorAssertion =
      user.groupTotal(group.groupId) == 0.0
      || user.groupTotal(group.groupId) == null
      || group.total == 0.0
      || group.total == null;

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
              if(!widthFactorAssertion)
              FractionallySizedBox(
                // Inserir porcentagem correta
                widthFactor: user.groupTotal(group.groupId) / group.total,
                // Cor correta
                child: Container(color: Colors.green),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: 100,
          child: Text(
            'R\$ ${user.groupTotal(group.groupId).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

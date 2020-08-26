import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/group.dart';
import '../utils/app_routes.dart';

import '../providers/user.dart';

class UserCard extends StatelessWidget {
  final User user;

  UserCard(this.user);

  @override
  Widget build(BuildContext context) {
    final group = Provider.of<Group>(context);

    bool widthFactorAssertion = user.groupTotal(group.groupId) == 0.0 ||
        user.groupTotal(group.groupId) == null ||
        group.total == 0.0 ||
        group.total == null;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5
      ),
        onTap: () async {
          await Navigator.of(context).pushNamed(
            AppRoutes.USER_SCREEN,
            arguments: user
          );
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
              if (!widthFactorAssertion)
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
    );
  }
}

import 'package:flutter/material.dart';
import '../providers/user.dart';


class UserMainCard extends StatelessWidget {
  final User _user;

  UserMainCard(this._user);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: <Widget>[
          // PieChart(),
          Column(
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'R\$ total',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          )
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    );
  }
}

import 'package:flutter/material.dart';

import 'pie_chart.dart';

class MainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: <Widget>[
          PieChart(),
          Column(
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'R\$ 00000,00',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: Text(
                      'Usuário 1',
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    child: Text(
                      'Usuário 2',
                      style: TextStyle(
                        fontSize: 9,
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    child: Text(
                      'Usuário 3',
                        style: TextStyle(
                          fontSize: 9,
                        ),
                    ),
                  ),
                  SizedBox(width: 6),
                ],
              )
            ],
          )
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    );
  }
}

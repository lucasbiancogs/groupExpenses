import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

import '../providers/group.dart';

class GroupMainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final group = Provider.of<Group>(context);
    return Card(
      elevation: 8,
      child: Row(
        children: <Widget>[
          PieChart(
            chartRadius: 180,
            showLegends: false,
            dataMap: group.pieChartMap,
          ),
          Column(
            children: <Widget>[
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'R\$ ${group.total.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Row(
                  children: group.users.map((user) {
                return Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                  ],
                );
              }).toList()),
            ],
          )
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    );
  }
}

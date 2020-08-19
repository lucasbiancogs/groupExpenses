import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              child: Text('Gráfico em pizza'),
              radius: 90,
            ),
          );
  }
}
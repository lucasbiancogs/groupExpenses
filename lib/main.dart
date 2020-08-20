import 'package:flutter/material.dart';

import 'screens/group_screen.dart';
import 'data/dummy_data.dart';

void main() => runApp(GroupExpenses());

class GroupExpenses extends StatelessWidget {
  final data = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[200],
        accentColor: Colors.grey[350],
        fontFamily: 'Lato',
      ),
      // To tentando passar um user por dummy data
      home: GroupScreen(data[1]),
    );
  }
}

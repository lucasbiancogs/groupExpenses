import 'package:flutter/material.dart';

import 'screens/user_screen.dart';

void main() => runApp(GroupExpenses());

class GroupExpenses extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.red[200],
        accentColor: Colors.grey[350],
        fontFamily: 'Lato',
      ),
      home: UserScreen(),
    );
  }
}

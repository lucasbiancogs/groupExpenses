import 'package:flutter/material.dart';
import 'package:groupExpenses/providers/auth.dart';
import 'package:provider/provider.dart';

import 'screens/user_screen.dart';

import 'providers/group.dart';
import 'providers/user.dart';

void main() => runApp(GroupExpenses());

class GroupExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => new User(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Group(),
        ),
      ],
          child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          primaryColor: Colors.red[200],
          accentColor: Colors.grey[350],
          fontFamily: 'Lato',
        ),
        
        // To tentando passar um user por dummy data
        home: UserScreen(),
      ),
    );
  }
}

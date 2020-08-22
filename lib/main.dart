import 'package:flutter/material.dart';
import 'package:groupExpenses/providers/auth.dart';
import 'package:provider/provider.dart';

import 'screens/user_screen.dart';
import 'data/dummy_data.dart';

import 'providers/groups.dart';
import 'providers/group.dart';
import 'providers/user.dart';

void main() => runApp(GroupExpenses());

class GroupExpenses extends StatelessWidget {
  final data = DUMMY_DATA;

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
        ChangeNotifierProxyProvider<User, Groups>(
          create: (_) => new Groups([]),
          update: (_, user, prevGroups) => Groups(user.groupsId),
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

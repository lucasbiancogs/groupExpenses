import 'package:flutter/material.dart';
import 'package:groupExpenses/providers/auth.dart';
import 'package:groupExpenses/screens/auth_or_home.dart';
import 'package:provider/provider.dart';


void main() => runApp(GroupExpenses());

class GroupExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
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
        home: AuthOrHome(),
      ),
    );
  }
}

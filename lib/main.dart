import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';

import 'utils/app_routes.dart';
import 'screens/auth_screen.dart';
import 'screens/group_screen.dart';
import 'screens/user_screen.dart';
import 'screens/transaction_list_screen.dart';


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
          textTheme: TextTheme(
            headline2: TextStyle(color: Colors.red[400])
          ),
          fontFamily: 'Lato',
        ),
        
        // To tentando passar um user por dummy data
        home: AuthScreen(),
        routes: {
          AppRoutes.AUTH: (ctx) => AuthScreen(),
          AppRoutes.GROUP_SCREEN: (ctx) => GroupScreen(),
          AppRoutes.USER_SCREEN: (ctx) => UserScreen(),
          AppRoutes.TRANSACTION_LIST_SCREEN: (ctx) => TransactionListScreen(),
        },
      ),
    );
  }
}

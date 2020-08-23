import 'package:flutter/material.dart';
import '../screens/group_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

import '../screens/auth_screen.dart';

class AuthOrHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return auth.isAuth ? GroupScreen(auth.groups[0]) : AuthScreen();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';
// import '../components/user_main_card.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments as User;

    return ChangeNotifierProvider.value(
      value: user,
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // UserMainCard(),
              Text('Oi'),
            ],
          ),
        ),
      ),
    );
  }
}

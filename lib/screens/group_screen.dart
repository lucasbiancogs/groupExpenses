import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import '../components/user_card.dart';
import '../components/group_main_card.dart';
import '../providers/group.dart';

class GroupScreen extends StatelessWidget {
  final Group group;

  GroupScreen(this.group);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new GroupProvider(group),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(group.name),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GroupMainCard(group),
              Container(
                height: 300,
                child: ListView(
                  children: group.users.map((user) {
                    return UserCard(user);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}

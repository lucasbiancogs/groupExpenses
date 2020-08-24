import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import '../components/user_card.dart';
import '../components/group_main_card.dart';

import '../providers/group.dart';
import '../providers/auth.dart';

class GroupScreen extends StatelessWidget {
  final Group group;

  GroupScreen(this.group);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

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
              GroupMainCard(),
              Container(
                height: MediaQuery.of(context).size.height - 400,
                child: ListView(
                  children: group.users.map((user) {
                    return UserCard(user);
                  }).toList(),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}

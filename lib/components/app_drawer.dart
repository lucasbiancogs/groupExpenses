import 'package:flutter/material.dart';
import 'package:groupExpenses/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/group_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Bem vindo'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
              leading: Icon(Icons.format_list_bulleted),
              title: Text('Lançamentos'),
              onTap: () async {
                await Navigator.of(context).pushNamed(
                    AppRoutes.TRANSACTION_LIST_SCREEN,
                    arguments: auth.transactions);
              }),
          Column(
            children: auth.groups.map((group) {
              return ListTile(
                  leading: Icon(Icons.group),
                  title: Text(group.name),
                  onTap: () async {
                    await Navigator.of(context).popAndPushNamed(
                        AppRoutes.GROUP_SCREEN,
                        arguments: group);
                  });
            }).toList(),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () => auth.logout(context),
          ),
        ],
      ),
    );
  }
}

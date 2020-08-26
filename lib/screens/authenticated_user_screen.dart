import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../components/app_drawer.dart';

class AuthenticatedUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<Auth>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Group Expenses'),
      ),
      body: FutureBuilder(
          future: auth.loadAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              );
            } else {
              return Column(
                children: [
                  Center(child: Text('Olá ${auth.name}')),
                  RaisedButton(
                      child: Text('Adicionar Grupo'),
                      onPressed: () async {
                        await auth.addGroup('Família', auth.userId);
                      }),
                ],
              );
            }
          }),
      drawer: AppDrawer(),
    );
  }
}

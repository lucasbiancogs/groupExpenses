import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import '../components/user_card.dart';
import '../components/group_main_card.dart';
import '../components/transaction_form.dart';

import '../providers/group.dart';

class GroupScreen extends StatelessWidget {

  openTransactionFormModal(BuildContext context, Group group) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return TransactionForm(group);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments as Group;
    
    return ChangeNotifierProvider.value(
      value: group,
      child: Scaffold(
      appBar: AppBar(
        title: Text(group.name),
        actions: [
          IconButton(icon: Icon(Icons.send), onPressed: () {})
        ],
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
                  return Column(
                    children: [
                      UserCard(user),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.add,
                size: 40,
              ),
              onPressed: () => openTransactionFormModal(context, group),
            )
          ],
        ),
      ),
      drawer: AppDrawer(),
    ),
    );
  }
}

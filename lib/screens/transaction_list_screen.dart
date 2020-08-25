import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/app_drawer.dart';
import '../providers/transaction.dart';
import '../providers/auth.dart';

class TransactionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    final List<Transaction> transactions =
        ModalRoute.of(context).settings.arguments as List<Transaction>;
    return Scaffold(
      appBar: AppBar(
        title: Text('Lançamentos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              ListTile(
                leading: Text(
                  'R\$ ${transactions[i].value.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
                title: Text(auth.groupName(transactions[i].groupId)),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}

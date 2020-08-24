import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'transaction.dart';

class User with ChangeNotifier {
  String userId;
  String name;
  List<Transaction> transactions = [];
  List<String> groupsId = [];

  User([this.userId]);

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Future<void> loadUser() async {
    print('Carregando usuário $userId ...');
    final response = await http.get('$_baseUrl/users/$userId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    this.name = data['name'];
    print('User name: $name');

    final List<dynamic> transactionsData =
        data['transactions'] as List<dynamic>;
    transactionsData.forEach((transactionData) {
      transactions.add(Transaction(
        transactionId: Random().nextDouble().toString(),
        value: transactionData['value'],
        groupId: transactionData['groupId'],
      ));
    });
    print('Total de ${transactions.length} transações.');
    transactions.forEach((transaction) {
      print('TransactionId: ${transaction.transactionId}');
      print('Value: ${transaction.value}');
      print('GroupId: ${transaction.groupId}');
    });

    print('Usuário carregado.');
    return Future.value();
  }

  List<Transaction> userGroupTransacions(String groupId) {
    return transactions.where((transaction) => transaction.groupId == groupId);
  }
}

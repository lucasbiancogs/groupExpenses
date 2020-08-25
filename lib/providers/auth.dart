import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:groupExpenses/utils/app_routes.dart';
import 'package:http/http.dart' as http;

import 'group.dart';
import 'transaction.dart';

class Auth with ChangeNotifier {
  String userId;
  String name;
  List<Transaction> transactions = [];
  List<String> groupsId = [];
  List<Group> groups = [];

  bool isAuth = false;

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Future<void> loadAuth() async {
    this.name = null;
    this.transactions = null;
    this.groupsId = null;
    print('Carregando usuário autenticado $userId ...');
    final response = await http.get('$_baseUrl/users/$userId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    this.name = data['name'];
    print('Auth user name: $name');

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

    final List<dynamic> groupsIdData = data['groupsId'] as List<dynamic>;
    final groupsId = groupsIdData.map((groupId) => groupId.toString()).toList();
    this.groupsId = groupsId;
    print('Auth GroupsId: $groupsId');

    print('Usuário autenticado carregado.');
    return Future.value();
  }

  Future<void> loadGroups() async {
    groups = [];
    groupsId.forEach((groupId) async {
      groups.add(Group(groupId));
    });
    print('Carregando ${groups.length} grupo(s)...');
    await Future.forEach(groups, (Group group) async {
      /*
      Existe um problema com o forEach para carregar múltiplos Futures
      pois ele não retorna um Future
      por isso deve-se usar o Future.forEach....
      */
      await group.loadGroup();
      return Future.value();
    });
    return Future.value();
  }

  Future<void> login(BuildContext context) async {
    // Por enquanto só isso
    // Depois isso vai ser a resposta de uma requisição http
    userId = '-MFNNXKUcVSI0Ob0iHZK';
    await loadAuth();
    await loadGroups();

    print('Autenticação realizada com sucesso.');
    isAuth = true;
    Navigator.of(context).pushNamed(
      AppRoutes.GROUP_SCREEN,
      arguments: groups[0],
    );
    notifyListeners();
  }

  void logout(BuildContext context) {
    this.isAuth = false;
    this.userId = null;
    this.name = null;
    this.groupsId = [];
    this.groups = [];

    Navigator.of(context).pushNamed(
      AppRoutes.AUTH,
    );
    notifyListeners();
  }

  Future<void> signup() async {
    final response = await http.post(
        'https://groupexpenses-lucasbianco.firebaseio.com/users.json',
        body: json.encode({
          'name': 'Nairana',
          'groupsId': [
            '-MFEN4XyYIo-B8-Fpf-U',
          ].map((u) => u).toList(),
          'transactions': [
            {'value': 80.0, 'groupId': '-MFEN4XyYIo-B8-Fpf-U'},
            {'value': 110.0, 'groupId': '-MFEN4XyYIo-B8-Fpf-U'},
          ].map((t) => t).toList()
        }));
  }

  Future<void> addGroup() async {
    final response = await http.post(
        'https://groupexpenses-lucasbianco.firebaseio.com/groups.json',
        body: json.encode({
          'name': 'Loja',
          'usersId': [
            '-MFNNXKUcVSI0Ob0iHZK',
            '-MFVEnxWFtB4BkBfefpv',
          ].map((u) => u).toList(),
        }));
  }

  String groupName(String groupId) {
    String groupName = '';
    groups.forEach((group) {
      if (group.groupId == groupId) groupName = group.name;
    });
    return groupName;
  }
}

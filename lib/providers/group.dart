import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

class Group with ChangeNotifier {
  String groupId;
  String name;
  List<String> usersId = [];
  List<User> users = [];

  Group([this.groupId]);

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Future<void> loadGroup() async {
    print('Carregando grupo: $groupId ...');
    final response = await http.get('$_baseUrl/groups/$groupId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    name = data['name'];
    print('Group name: $name');

    final List<dynamic> usersIdData = data['usersId'] as List<dynamic>;
    final usersId = usersIdData.map((usersId) => usersId.toString()).toList();
    this.usersId = usersId;

    print('UsersId: $usersId');

    await loadUsers();
    print('Grupo carregado.');

    return Future.value();
  }

  Future<void> loadUsers() async {
    users = [];
    usersId.forEach((userId) async {
      users.add(User(userId));
    });
    print('Carregando ${usersId.length} usuário(s)...');
    await Future.forEach(users, (User user) async {
      /*
      Existe um problema com o forEach para carregar múltiplos Futures
      pois ele não retorna um Future
      por isso deve-se usar o Future.forEach....
      */
      await user.loadUser();
      return Future.value();
    });
    return Future.value();
  }

  double get total {
    double total = 0;
    users.forEach((user) {
      total += user.groupTotal(groupId);
    });
    return total;
  }

  Map<String, double> get pieChartMap {
    Map<String, double> dataMap = Map();
    users.forEach((user) {
      dataMap.putIfAbsent(user.name, () => user.groupTotal(groupId));
    });

    return dataMap;
  }

}

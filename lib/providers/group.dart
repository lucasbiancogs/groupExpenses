import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

class Group with ChangeNotifier {
  String groupId;
  String name;
  List<String> usersId = [];

  List<User> users = [];

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Group([this.groupId]);

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
    print('Grupo carregado.');
  }

  // Criar metodo de carregar os usuários
}

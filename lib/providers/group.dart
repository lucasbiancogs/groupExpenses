import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user.dart';

class Group with ChangeNotifier {
  String _groupId;
  String name;
  List<String> _usersId = [];

  List<User> users = [];

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Group([this._groupId]);

  Future<void> loadGroup() async {
    print('Carregando grupo: $_groupId ...');
    if (_groupId != null) {
      final response = await http.get('$_baseUrl/groups/$_groupId.json');
      final Map<String, dynamic> data = json.decode(response.body);
      name = data['name'];
      print('Group name: $name');

      final List<dynamic> usersIdData = data['usersId'] as List<dynamic>;
      final usersId = usersIdData.map((usersId) => usersId.toString()).toList();
      _usersId = usersId;

      print('UsersId: $_usersId');
      print('Grupo carregado.');
    } else {
      print('Erro, grupo não encontrado');
    }

    return Future.value();
  }

  // Criar metodo de carregar os usuários
}

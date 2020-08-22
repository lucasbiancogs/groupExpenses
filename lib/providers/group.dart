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

  Group();

  Future<void> loadGroup() async {
    print(_groupId);
    if (_groupId != null) {
      final response = await http.get('$_baseUrl/groups/$_groupId.json');
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      final List<dynamic> usersIdData = data['usersId'] as List<dynamic>;
      final usersId = usersIdData.map((usersId) => usersId.toString()).toList();
      _usersId = usersId;

      print(_usersId);
    }
  }

  // Criar metodo de carregar os usuários
}

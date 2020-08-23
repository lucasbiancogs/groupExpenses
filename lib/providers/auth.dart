import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'group.dart';

class Auth with ChangeNotifier {
  String _userId;
  String name;
  List<String> _groupsId = [];
  List<Group> groups = [];

  bool isAuth = false;

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Future<void> loadUser() async {
    print('Carregando usuário $_userId ...');
    final response = await http.get('$_baseUrl/users/$_userId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    name = data['name'];
    print('User name: $name');

    final List<dynamic> groupsIdData = data['groupsId'] as List<dynamic>;
    final groupsId = groupsIdData.map((groupId) => groupId.toString()).toList();
    _groupsId = groupsId;
    print('GroupsId: $_groupsId');

    print('Usuário carregado.');
    return Future.value();
  }

  Future<void> loadGroups() async {
    groups = [];
    _groupsId.forEach((groupId) {
      groups.add(Group(groupId));
    });
    groups.forEach((group) async {
      print('Carregando ${groups.length} grupos...');
      await group.loadGroup();
    });

    return Future.value();
  }

  Future<void> login() async {
    // Por enquanto só isso
    // Depois isso vai ser a resposta de uma requisição http
    _userId = '-MFNNXKUcVSI0Ob0iHZK';
    await loadUser();
    await loadGroups();
    isAuth = true;

    print('Autenticação realizada com sucesso');
    notifyListeners();
  }

  Future<void> teste() async {
    final response = await http.post(
        'https://groupexpenses-lucasbianco.firebaseio.com/users.json',
        body: json.encode({
          'name': 'Lucas',
          'groupsId': [
            '-MFEN4XyYIo-B8-Fpf-U',
          ].map((u) => u).toList(),
          'transactions': [
            {'value': 10.0, 'groupId': '-MFEN4XyYIo-B8-Fpf-U'}
          ].map((t) => t).toList()
        }));
  }
}

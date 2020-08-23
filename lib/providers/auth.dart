import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'group.dart';

class Auth with ChangeNotifier {
  String _userId = '-MFNNXKUcVSI0Ob0iHZK';
  String name;
  List<String> _groupsId = [];

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Future<void> loadUser() async {
    final response = await http.get('$_baseUrl/users/$_userId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> groupsIdData = data['groupsId'] as List<dynamic>;
    final groupsId = groupsIdData.map((groupId) => groupId.toString()).toList();
    _groupsId = groupsId;

    print(_groupsId);

    return Future.value();
  }

  List<Group> get groups {
    final List<Group> groups = [];
    _groupsId.forEach((groupId) {
      groups.add(Group(groupId));
    });
    return groups;
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

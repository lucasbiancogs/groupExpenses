import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'group.dart';

class Auth with ChangeNotifier {
  String _userId = '-MFEOtnGHMqEBVQ0GNZD';
  String name;
  List<String> _groupsId = [];
  List<Group> groups = [];

  static const _baseUrl = 'https://groupexpenses-lucasbianco.firebaseio.com';

  Future<void> loadUser() async {
    final response = await http.get('$_baseUrl/users/$_userId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    print(data);

    name = data['name'];
    print(data['groupsId']);
    return Future.value();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groupExpenses/data/dummy_data.dart';
import 'package:http/http.dart' as http;

import '../providers/group.dart';

class Groups with ChangeNotifier {
  List<String> _groupsId = [];

  Groups(this._groupsId);

  List<Group> get groups {
    final List<Group> allGroups = DUMMY_DATA['groups'];
    final List<Group> groups = [];
    _groupsId.map((id) {
      return allGroups.map((group) => {if (group.id == id) groups.add(group)});
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
            {
              'value': 10.0,
              'groupId': '-MFEN4XyYIo-B8-Fpf-U'
            }
          ].map((t) => t).toList()
        }));

    print(response.body);
  }
}

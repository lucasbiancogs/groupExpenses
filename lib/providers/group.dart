import 'package:flutter/material.dart';

import 'user.dart';
import '../data/dummy_data.dart';

class Group with ChangeNotifier {
  final String id;
  String name;
  List<String> usersId = [];

  Group({this.id, this.usersId, this.name});

  List<User> get users {
    final data = DUMMY_DATA;
    List<ChangeNotifier> allUsers = data['users'];

    return allUsers;
  }

  Function teste() {
    final data = DUMMY_DATA;
    print(data);
    List<ChangeNotifier> allUsers = data['users'];

    print(allUsers);
  }
}

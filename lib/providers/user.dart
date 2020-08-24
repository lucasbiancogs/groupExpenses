import 'package:flutter/material.dart';

import 'transaction.dart';

class User with ChangeNotifier {
  String id;
  String _name;
  List<Transaction> _transactions = [];
  List<String> _groupsId = [];
  // String _imageUrl talvez isso deva ficar só no firebase

}

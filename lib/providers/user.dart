import 'package:flutter/material.dart';
import 'package:groupExpenses/data/dummy_data.dart';

import 'transaction.dart';

class User with ChangeNotifier {
  String id;
  String _name;
  List<Transaction> _transactions = [];
  List<String> _groupsId = [];
  // String _imageUrl talvez isso deva ficar só no firebase

  String get name {
    final name = _name;

    return name;
  }

  List<String> get groupsId {
    final groupsId = _groupsId;

    return groupsId;
  }

  double get total {
    final double total =
        _transactions.fold(0, (sum, transaction) => sum + transaction.value);

    return total;
  }
}

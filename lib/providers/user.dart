import 'package:flutter/material.dart';
import 'package:groupExpenses/data/dummy_data.dart';

import 'transaction.dart';

class User with ChangeNotifier {
  String id = 'u1';
  String _name = 'Lucas';
  List<Transaction> _transactions = [
    Transaction(id: 't1', value: 10, groupId: 'g1'),
  ];
  List<String> _groupsId = [
    'g1',
  ];
  // String _imageUrl talvez isso deva ficar só no firebase

  String get name {
    final name = _name;

    return name;
  }

  double get total {
    final double total =
        _transactions.fold(0, (sum, transaction) => sum + transaction.value);

    return total;
  }
}

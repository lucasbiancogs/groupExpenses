import 'package:flutter/material.dart';
import 'package:groupExpenses/data/dummy_data.dart';

import 'transaction.dart';

class User with ChangeNotifier {
  String id = '-MFEOtnGHMqEBVQ0GNZD';
  String _name;
  List<Transaction> _transactions = [
    Transaction(id: 't1', value: 10, groupId: 'g1'),
  ];
  List<String> _groupsId = [
    '-MFEN4XyYIo-B8-Fpf-U',
  ];
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

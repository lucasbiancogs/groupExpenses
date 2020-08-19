import '../providers/group.dart';
import '../providers/user.dart';
import '../providers/transaction.dart';

final DUMMY_DATA = [
  Group(
    id: 'g1',
    users: [
      User(
        id: 'u1',
        transactions: [
          Transaction(
            id: 't1',
            value: 1.0,
          )
        ],
      ),
    ],
  ),
  Group(
    id: 'g2',
    users: [
      User(
        id: 'u2',
        transactions: [
          Transaction(
            id: 't2',
            value: 10.0,
          )
        ],
      ),
      User(
        id: 'u3',
        transactions: [
          Transaction(
            id: 't3',
            value: 100.0,
          ),
          Transaction(
            id: 't4',
            value: 1000.0,
          )
        ],
      ),
    ],
  ),
];

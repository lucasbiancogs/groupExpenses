import '../providers/group.dart';
import '../providers/user.dart';
import '../providers/transaction.dart';



final DUMMY_DATA = {
  'groups': [
    Group(
      id: 'g1',
      name: 'Família',
      usersId: [
        'u1',
        'u2',
        'u3',
        'u4',
      ],
    ),
    Group(
      id: 'g2',
      name: 'Loja',
      usersId: [
        'u2',
        'u3',
      ],
    ),
  ]
};

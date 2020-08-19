import 'user.dart';

class Group {
  final String id;
  List<User> users = [];

  Group({this.id, this.users});

  double get total {
    List<double> values = [];
    users.forEach((user) => values.add(user.total));

    double total = values.fold(0, (sum, value) => sum + value);

    return total;
  }
}

import 'user.dart';

class Group {
  final String id;
  List<User> users = [];

  Group({this.id, this.users});
}

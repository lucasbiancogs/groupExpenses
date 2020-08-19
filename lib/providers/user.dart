import 'transaction.dart';

class User {
  final String id;
  List<Transaction> transactions = [];
  // String _imageUrl talvez isso deva ficar só no firebase

  User({this.id, this.transactions});
}

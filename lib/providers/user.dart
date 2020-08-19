import 'transaction.dart';

class User {
  final String id;
  List<Transaction> transactions = [];
  // String _imageUrl talvez isso deva ficar só no firebase

  User({this.id, this.transactions});

  double get total {
    final double total = transactions.fold(
        0, (sum, transaction) => sum + transaction.value);

    return total;
  }
}

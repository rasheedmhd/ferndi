import "package:uuid/uuid.dart";
import "package:app/models/wallets.dart";

const uuid = Uuid();

enum Category {
  Food,
  Groceries,
  Work,
  Health,
  Transportation,
  // more categories will be added later and
  // provided as default
  // Functionality will be added later as well
  // to allow users to add categories manually
}

class Spend {
  Spend({
    required this.name,
    this.description,
    required this.amount,
    required this.wallet,
    required this.category,
  })  : id = uuid.v4(),
        date = DateTime.now();

  final String id;
  // name or description of what you bought
  // or spent on
  final String name;
  final String? description;
  // amount spent
  final double amount;
  final DateTime date;
  // wallet paid from for the spend
  final Wallet wallet;
  final Category category;

  String get getCategory => category.name;
  String get getAmount  => amount.toStringAsFixed(2);
  String get getWallet => wallet.name;
}

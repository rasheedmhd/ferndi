import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

final List<Wallet> onboardWallets = [
  Wallet(ObjectId(), "Savings", 0, DateTime.now()),
  Wallet(ObjectId(), "Debts", 0, DateTime.now()),
  Wallet(ObjectId(), "Flexible", 0, DateTime.now()),
  Wallet(ObjectId(), "Income", 0, DateTime.now()),
];


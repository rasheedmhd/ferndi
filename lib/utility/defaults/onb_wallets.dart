import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

final List<Wallet> onboardWallets = [
  Wallet(ObjectId(), "Savings", 0),
  Wallet(ObjectId(), "Debts", 0),
  Wallet(ObjectId(), "Flexible", 0),
  Wallet(ObjectId(), "Income", 0),
];


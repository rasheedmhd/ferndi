import "package:uuid/uuid.dart";
import "package:app/models/wallets.dart";

const uuid = Uuid();

enum Duration {
  Month,
  Year,
}

class Subscription {
  Subscription({
    required this.name,
    required this.amount,
    required this.wallet,
    required this.duration,
  })  : id = uuid.v4(),
        date = DateTime.now();

  final String id;
  final String name;
  final double amount;
  final DateTime date;
  // Right now, All my subscriptions are been paid from my Credit Card
  // So ideally I don't need the specify when creating a subscription
  // Also in Settings, I will have settings that allows users to set default
  // wallets for spends
  // Drop down menu of all wallets created by the user
  // Name of wallet subscriptions are been paid from
  final Wallet wallet;

  // An enum of whether the subscription is for a month or year.
  final Duration duration;

  String get period => duration.name;
  String get getAmount => amount.toStringAsFixed(2);
  String get from => wallet.name;
}

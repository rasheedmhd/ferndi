import 'package:app/models/schemas.dart';

final wallets = realm.all<Wallet>();
final spends = realm.all<Spend>();
final categories = realm.all<Category>();
final duration = realm.all<Duration>();
final subscriptions = realm.all<Subscription>();
// for later feature
// final budgets = realm.all<Budget>;

// Querying data for balance card
final balance = wallets
    .map((wallet) => wallet.balance)
    .toList()
    .fold(0, (value, element) => value + element);
final income = realm.query<Wallet>('name == \$0', ['Income']).first ;

// // Querying data for selected wallets in accounts page wallets card
final savings = realm.query<Wallet>('name == \$0', ['Savings']).first;
final debts = realm.query<Wallet>('name == \$0', ['Debts']).first;
final flexible = realm.query<Wallet>('name == \$0', ['Flexible']).first;

final totalSpendByCategory = categories
    .map((category) => category.category
    .map((spend) => (spend.amount))
    .fold(0, (value, element) => value + element));



getSpendsByWallet(String walletName) {
  final spendsByWallet = realm.query<Spend>("wallet.name == \$0", [walletName]);
  return spendsByWallet;
}

getSpendsByCategory(String categoryName) {
  final spendsByCategory =
      realm.query<Spend>("category.name == \$0", [categoryName]);
  return spendsByCategory;
}

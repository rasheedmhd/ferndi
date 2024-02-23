import 'package:app/models/schemas.dart';
import "package:realm/realm.dart" as r;


final wallets = realm.all<Wallet>();
final spends = realm.all<Spend>();
final categories = realm.all<Category>();
final duration = realm.all<Duration>();
final subscriptions = realm.all<Subscription>();
// for later feature
// final budgets = realm.all<Budget>;

final income    = wallets.isEmpty ? Wallet(r.ObjectId(), "Income", 0)  : realm.query<Wallet>('name == \$0', ['Income']).firstOrNull;
final savings   = wallets.isEmpty ? Wallet(r.ObjectId(), "Savings", 0) : realm.query<Wallet>('name == \$0', ['Savings']).firstOrNull;
final flexible  = wallets.isEmpty ? Wallet(r.ObjectId(), "Flexible", 0): realm.query<Wallet>('name == \$0', ['Flexible']).firstOrNull;

// // Querying data for selected wallets in accounts page wallets card

getSpendsByWallet(String walletName) {
  final spendsByWallet = realm.query<Spend>("wallet.name == \$0", [walletName]);
  return spendsByWallet;
}

getSpendsByCategory(String categoryName) {
  final spendsByCategory =
      realm.query<Spend>("category.name == \$0", [categoryName]);
  return spendsByCategory;
}

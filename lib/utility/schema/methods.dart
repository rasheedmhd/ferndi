import 'package:app/models/schemas.dart';
import 'package:app/utility/defaults/categories.dart';
import 'package:app/utility/defaults/onb_wallets.dart';
import 'package:app/utility/defaults/onb_durations.dart';

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

final categoriesCount = categories.length;

void updateCategory(Category category) {
  realm.write(() {
    realm.add<Category>(category, update: true);
  });
}


// Create a new Category record and persist to db
void createCategory(Category category) {
  realm.write(() {
    realm.add(category);
  });
}

// Create a bunch of Categories when getting onboard
void addCategories() {
  realm.write(() {
    realm.addAll(onboardCategories);
  });
}

void deleteCategory(Category category) {
  realm.write(() {
    realm.delete(category);
  });
}

void addDurations() {
  realm.write(() {
    realm.addAll(durations);
  });
}

void addWallets() {
  realm.write(() {
    realm.addAll(onboardWallets);
  });
}


getSpendsByWallet(String walletName) {
  final spendsByWallet = realm.query<Spend>("wallet.name == \$0", [walletName]);
  return spendsByWallet;
}

getSpendsByCategory(String categoryName) {
  final spendsByCategory =
      realm.query<Spend>("category.name == \$0", [categoryName]);
  return spendsByCategory;
}

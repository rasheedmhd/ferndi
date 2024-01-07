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
    .reduce((value, element) => value + element);
final income = realm.query<Wallet>('name == \$0', ['Income']).first;

// Querying data for selected wallets in accounts page wallets card
final savings = realm.query<Wallet>('name == \$0', ['Savings']).first;
final debts = realm.query<Wallet>('name == \$0', ['Debts']).first;
final flexible = realm.query<Wallet>('name == \$0', ['Flexible']).first;
final totalSpend = spends
    .map((spend) => spend.amount)
    .toList()
    .reduce((value, element) => value + element);
final totalTransactions = spends
    .map((spend) => spend.amount)
    .toList().length;


// Querying data for Subscriptions balance card
final num subBalance = subscriptions
    .map((subscription) => subscription.amount)
    .toList()
    .reduce((value, element) => value + element);
final totalMonthlySubscriptionsBalance =
    realm.query<Subscription>('duration.name == \$0', ['month'])
    .toList()
    .map((sub) => (sub.amount))
    .toList()
    .reduce((value, element) => value + element);
final totalYearlySubscriptionsBalance =
    realm.query<Subscription>('duration.name == \$0', ['year'])
    .toList()
    .map((sub) => (sub.amount))
    .toList()
    .reduce((value, element) => value + element);
final totalOneTimeSubscriptionsBalance =
    realm.query<Subscription>('duration.name == \$0', ['one time'])
    .toList()
    .map((sub) => (sub.amount))
    .toList()
    .reduce((value, element) => value + element);


// Create a new wallet and persist to db
void createWallet(Wallet wallet) {
  realm.write(() {
    realm.add(wallet);
  });
}

void deleteWallet(Wallet wallet) {
  realm.write(() {
    realm.delete(wallet);
  });
}

// Create a new spend record and persist to db
void recordSpend(Spend spend) {
  realm.write(() {
    realm.add(spend);
  });
}


void upateSpend(Spend spend) {
    realm.write(() {
     realm.add<Spend>(spend, update: true);
  });
}

void deleteSpend(Spend spend) {
  realm.write(() {
    realm.delete<Spend>(spend);
  });
}

// Create a new spend record and persist to db
void addSubscription(Subscription subscription) {
  realm.write(() {
    realm.add(subscription);
  });
}

void deleteSubscription(Subscription subscription) {
  realm.write(() {
    realm.delete(subscription);
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
    realm.addAll(Categories);
  });
}

void addDurations() {
  realm.write(() {
    realm.addAll(Durations);
  });
}

void deleteCategory(Category category) {
  realm.write(() {
    realm.delete(category);
  });
}

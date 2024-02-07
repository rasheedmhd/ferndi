import "package:realm/realm.dart";
part "schemas.g.dart";

final config = Configuration.local([
  Spend.schema,
  Wallet.schema,
  Subscription.schema,
  Category.schema,
  Duration.schema,
], schemaVersion: 3, shouldDeleteIfMigrationNeeded: true);

final realm = Realm(config);

const String categoryEmoji = "💸";
const String categoryColor = "Color.fromARGB(255, 205, 227, 255)";

final onboardCategories = <Category>[
  Category(ObjectId(), "Health", categoryEmoji, categoryColor),
  Category(ObjectId(), "Food", categoryEmoji, categoryColor),
  Category(ObjectId(), "Electricity", categoryEmoji, categoryColor),
  Category(ObjectId(), "Groceries", categoryEmoji, categoryColor),
  Category(ObjectId(), "Transportation", categoryEmoji, categoryColor),
  Category(ObjectId(), "Miscellaneous", categoryEmoji, categoryColor),
  Category(ObjectId(), "Child Care", categoryEmoji, categoryColor),
  Category(ObjectId(), "Lifestyle", categoryEmoji, categoryColor),
  Category(ObjectId(), "Charity", categoryEmoji, categoryColor),
  Category(ObjectId(), "Banking", categoryEmoji, categoryColor),
  Category(ObjectId(), "Clothes", categoryEmoji, categoryColor),
  Category(ObjectId(), "Loan", categoryEmoji, categoryColor),
  Category(ObjectId(), "Entertainment", categoryEmoji, categoryColor),
  Category(ObjectId(), "Drinks", categoryEmoji, categoryColor),
  Category(ObjectId(), "Bills", categoryEmoji, categoryColor),
  Category(ObjectId(), "Home", categoryEmoji, categoryColor),
  Category(ObjectId(), "Insurance", categoryEmoji, categoryColor),
  Category(ObjectId(), "Internet", categoryEmoji, categoryColor),
  Category(ObjectId(), "Maintenance", categoryEmoji, categoryColor),
  Category(ObjectId(), "Rent", categoryEmoji, categoryColor),
  Category(ObjectId(), "Water", categoryEmoji, categoryColor),
  Category(ObjectId(), "Phone", categoryEmoji, categoryColor),
  Category(ObjectId(), "Education", categoryEmoji, categoryColor),
  Category(ObjectId(), "Gift", categoryEmoji, categoryColor),
  Category(ObjectId(), "Pharmacy", categoryEmoji, categoryColor),
  Category(ObjectId(), "Work", categoryEmoji, categoryColor),
  Category(ObjectId(), "Shopping", categoryEmoji, categoryColor),
  Category(ObjectId(), "Fuel", categoryEmoji, categoryColor),
];

final List<Wallet> onboardWallets = [
  Wallet(ObjectId(), "Savings", 0),
  Wallet(ObjectId(), "Debts", 0),
  Wallet(ObjectId(), "Flexible", 0),
  Wallet(ObjectId(), "Income", 0),
];

// Create a bunch of Durations when getting onboard
final durations = <Duration>[
  Duration(ObjectId(), "month"),
  Duration(ObjectId(), "year"),
  Duration(ObjectId(), "one time"),
];

@RealmModel()
class _Duration {
  @PrimaryKey()
  late ObjectId id;
  late String name;
}

@RealmModel()
class _Subscription {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late int amount;
  late DateTime date;
  // Also in Settings, I will have settings that allows users to set default
  // wallets for subscriptions
  late _Duration? duration;
  late _Wallet? wallet;
  // An enum of whether the subscription is for a month or year.

  String get getAmount => amount.toStringAsFixed(2);
  String? get period => duration?.name;
  String? get from => wallet?.name;
}

@RealmModel()
class _Wallet {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late int balance;
  late List<_Spend> spends;
  late List<_Subscription> subscriptions;

  String get bal => "GHS ${balance.toStringAsFixed(2)}";
}

@RealmModel()
class _Spend {
  @PrimaryKey()
  late ObjectId id;
  // name or description of what you bought
  // or spent on
  late String name;
  late String notes;
  // amount spent
  late int amount;
  late DateTime date;
  // wallet paid from for the spend
  late _Wallet? wallet;
  late _Category? category;

  @Backlink(#spends)
  late Iterable<_Wallet> linkedWallet;
  @Backlink(#category)
  late Iterable<_Category> linkedCategory;

  String? get getCategory => category?.name;
  String get getAmount => "GHS ${amount.toStringAsFixed(2)}";
  String? get getWallet => wallet?.name;
}

@RealmModel()
class _Category {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String emoji;
  late String color;
  late List<_Spend> category;
}

Wallet getWallet(ObjectId id) {
  final walletToEdit = realm.query<Wallet>('id == \$0', [id]).first;
  return walletToEdit;
}

Category getCategory(ObjectId id) {
  final categoryToEdit = realm.query<Category>('id == \$0', [id]).first;
  return categoryToEdit;
}

Spend getSpend(ObjectId id) {
  final spendToEdit = realm.query<Spend>('id == \$0', [id]).first;
  return spendToEdit;
}

Subscription getSubscription(ObjectId id) {
  final subscriptionToEdit = realm.query<Subscription>('id == \$0', [id]).first;
  return subscriptionToEdit;
}


//============ TO SUPPORT OLD CODE

// const WalletIcons = {
//   Wallet.PocketWallet: Icons.add_card,
//   Wallet.Cash: Icons.wallet_sharp,
//   Wallet.MobileMoney: Icons.phone_android,
//   Wallet.AccessDebitCard: Icons.card_giftcard_sharp,
//   Wallet.Miscellaneous: Icons.online_prediction_sharp,
// };

// const CategoryIcons = {
//   // when users create they own categories will
//   // be able to choose their own categories
//   Category.Food: Icons.restaurant,
//   Category.Groceries: Icons.shopping_cart,
//   Category.Work: Icons.work,
//   Category.Health: Icons.health_and_safety,
//   Category.Transportation: Icons.flight_takeoff,
//   Category.Miscellaneous: Icons.local_mall
// };

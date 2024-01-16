import "package:realm/realm.dart";
part "schemas.g.dart";

final config = Configuration.local([
  Spend.schema,
  Wallet.schema,
  Subscription.schema,
  Category.schema,
  Duration.schema,
], schemaVersion: 2, shouldDeleteIfMigrationNeeded: true);

final realm = Realm(config);

final onboardCategories = <Category>[
  Category(ObjectId(), "Health"),
  Category(ObjectId(), "Food"),
  Category(ObjectId(), "Electricity"),
  Category(ObjectId(), "Groceries"),
  Category(ObjectId(), "Transportation"),
  Category(ObjectId(), "Miscellaneous"),
  Category(ObjectId(), "Child Care"),
  Category(ObjectId(), "Lifestyle"),
  Category(ObjectId(), "Charity"),
  Category(ObjectId(), "Banking"),
  Category(ObjectId(), "Clothes"),
  Category(ObjectId(), "Loan"),
  Category(ObjectId(), "Entertainment"),
  Category(ObjectId(), "Drinks"),
  Category(ObjectId(), "Bills"),
  Category(ObjectId(), "Home"),
  Category(ObjectId(), "Insurance"),
  Category(ObjectId(), "Internet"),
  Category(ObjectId(), "Maintenance"),
  Category(ObjectId(), "Rent"),
  Category(ObjectId(), "Water"),
  Category(ObjectId(), "Phone"),
  Category(ObjectId(), "Education"),
  Category(ObjectId(), "Gift"),
  Category(ObjectId(), "Pharmacy"),
  Category(ObjectId(), "Work"),
  Category(ObjectId(), "Shopping"),
  Category(ObjectId(), "Fuel"),
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
  late List<_Spend> category;
}

Wallet getWallet(ObjectId id) {
  final walletToEdit = realm.query<Wallet>('id == \$0', [id]).first;
  return walletToEdit;
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

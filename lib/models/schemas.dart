import "package:realm/realm.dart";
part "schemas.g.dart";

final config = Configuration.local([
  Spend.schema,
  Wallet.schema,
  Subscription.schema,
  Category.schema,
  Duration.schema,
]);

final realm = Realm(config);

void addWallets(createdWallets) {
  realm.write(() {
    realm.addAll(createdWallets);
  });
}

// void addWallet(createdWallets) {
//   realm.write(() {
//     realm.add();
//   });
// }

// final List<Wallet> createdWallets = [
//   Wallet(ObjectId(), "MoMo Merchant", 50000),
//   Wallet(ObjectId(), "Cash", 70000),
//   Wallet(ObjectId(), "Access Bank Debit Card", 10000),
//   Wallet(ObjectId(), "MoMo Subscriber", 100000),
//   Wallet(ObjectId(), "MoMo Agent", 200000),
// ];

final qWallets = realm.all<Wallet>;

void addWallet(Wallet wallet) {
  realm.write(() {
    realm.add(wallet);
    print("Wallet created and persisted to mobile");
  });
}

final List<Spend> recordedSpends = [
  Spend(
      ObjectId(), "Plantain", "Food", 15, DateTime.utc(2022, 9, 18, 12, 30, 0)),
  Spend(ObjectId(), "Voltic 4 packs", "Water", 150,
      DateTime.utc(2022, 9, 18, 12, 30, 0)),
  Spend(
      ObjectId(), "Petrol", "Fuel", 100, DateTime.utc(2022, 9, 18, 12, 30, 0)),
  Spend(ObjectId(), "sagt m86", "Maintenance", 15,
      DateTime.utc(2022, 9, 18, 12, 30, 0)),
  Spend(ObjectId(), "Plain Rice", "Food", 15,
      DateTime.utc(2022, 9, 18, 12, 30, 0)),
];

// final List<Wallet> wallets = [
//   Wallet(ObjectId(), "Cash", 7000),
//   Wallet(ObjectId(), "Access", 7000),
//   Wallet(ObjectId(), "EcoBank", 7000),
//   Wallet(ObjectId(), "Momo", 7000),
//   Wallet(ObjectId(), "Agent", 7000),
//   Wallet(ObjectId(), "Merchant", 7000),
// ];

final List<Category> categories = [
  Category(ObjectId(), "Food"),
  Category(ObjectId(), "Electricity"),
  Category(ObjectId(), "Phone"),
  Category(ObjectId(), "Transportation"),
  Category(ObjectId(), "Health"),
  Category(ObjectId(), "Lifestyle"),
];

// final newWallets = realm.all<Wallet>();

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
  late double amount;
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
  late String balance;
  // late double balance;
  late List<_Spend> spends;
  late List<_Subscription> subscriptions;

  // String get bal => "GHS ${balance.toStringAsFixed(2)}";
}

@RealmModel()
class _TestWallet {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late double balance;
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
  late double amount;
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

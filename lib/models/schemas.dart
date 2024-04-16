import "package:realm/realm.dart";
part "schemas.g.dart";

final config = Configuration.local([
  Spend.schema,
  Wallet.schema,
  Subscription.schema,
  Category.schema,
  Duration.schema,
], schemaVersion: 6, shouldDeleteIfMigrationNeeded: true);

final realm = Realm(config);

@RealmModel()
class _Duration {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late DateTime createdAt;
}

@RealmModel()
class _Subscription {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late double amount;
  late DateTime createdAt;
  late DateTime chargeAt;
  // Also in Settings, I will have settings that allows users to set default
  // wallets for subscriptions
  late _Duration? duration;
  late _Wallet? wallet;
  String get getAmount => amount.toStringAsFixed(2);
  String? get period => duration?.name;
  String? get from => wallet?.name;
}

@RealmModel()
class _Wallet {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late double balance;
  late DateTime createdAt;
  late List<_Spend> spends;
  late List<_Subscription> subscriptions;

  String get bal => balance.toStringAsFixed(2);
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
  late DateTime createdAt;
  // wallet paid from for the spend
  late _Wallet? wallet;
  late _Category? category;

  @Backlink(#spends)
  late Iterable<_Wallet> linkedWallet;
  @Backlink(#category)
  late Iterable<_Category> linkedCategory;

  String? get getCategory => category?.name;
  String get getAmount => amount.toStringAsFixed(2);
  String? get getWallet => wallet?.name;
}

// [[ TOD DO ]]
// @RealmModel()
// class _Savings {
//   @PrimaryKey()
//   late ObjectId id;
//   // amount spent
//   late double amount;
//   late DateTime createdAt;
//   // wallet paid from for the spend
//   late _Wallet? wallet;

//   @Backlink(#savings)
//   late Iterable<_Wallet> linkedWallet;

//   String get getAmount => amount.toStringAsFixed(2);
//   String? get getWallet => wallet?.name;
// }

@RealmModel()
class _Category {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String emoji;
  late String color;
  late DateTime createdAt;
  late List<_Spend> category;
}


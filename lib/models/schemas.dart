import "package:realm/realm.dart";
part "schemas.g.dart";

final config = Configuration.local([
  Spend.schema,
  Wallet.schema,
  Subscription.schema,
  Category.schema,
  Duration.schema,
], schemaVersion: 4, shouldDeleteIfMigrationNeeded: true);

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
  late int amount;
  late DateTime createdAt;
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
  late DateTime createdAt;
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
  late DateTime createdAt;
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
  late DateTime createdAt;
  late List<_Spend> category;
}


import "package:realm/realm.dart";
// import "package:flutter/material.dart";
part "schemas.g.dart";

// @RealmModel()
// enum _Duration {
//   month,
//   year,
// }

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
  //late DateTime date;
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
  // name or description of what you bought
  // or spent on
  late String name;
  // amount spent
  late double amount;

  String get getAmount => "GHS ${amount.toStringAsFixed(2)}";
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

  String? get getCategory => category?.name;
  String get getAmount => "GHS ${amount.toStringAsFixed(2)}";
  String? get getWallet => wallet?.name;
}

@RealmModel()
class _Category {
  @PrimaryKey()
  late ObjectId id;
  late String name;
}

//============ TO SUPPORT OLD CODE
// enum Wallet {
//   PocketWallet,
//   Cash,
//   MobileMoney,
//   AccessDebitCard,
//   Miscellaneous,
// }

// const WalletIcons = {
//   Wallet.PocketWallet: Icons.add_card,
//   Wallet.Cash: Icons.wallet_sharp,
//   Wallet.MobileMoney: Icons.phone_android,
//   Wallet.AccessDebitCard: Icons.card_giftcard_sharp,
//   Wallet.Miscellaneous: Icons.online_prediction_sharp,
// };


// enum Category {
//   Food,
//   Groceries,
//   Work,
//   Health,
//   Transportation,
//   Miscellaneous,
//   // more categories will be added later and
//   // provided as default
//   // Functionality will be added later as well
//   // to allow users to add categories manually
// }

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
//import "package:uuid/uuid.dart";

// Right now we are using enums to capture the wallets the user has
// but later, we will set up functionality to allow users to
// add wallets

// This is because each individual wallet have their own amount of money inside them.
// We don't have a global single amount that all spends are from but rather,
// several wallets that we aggregate their total to know the amount of money that we have.

// This arrangement allows us to separate our spending.

enum Wallet {
  PocketWallet,
  Cash,
  MobileMoney,
  AccessDebitCard,
  Miscellaneous,
}

// For Later

// const uuid = Uuid();

// class Wallet {
//   Wallet({
//     required this.name,
//     required this.amount,
//   }) : id = uuid.v4();

//   final String id;
//   final String name;
//   final double amount;
//   // Right now, All my subscriptions are been paid from my Credit Card
//   // So ideally I don't need the specify when creating a subscription
//   // Also in Settings, I will have settings that allows users to set default
//   // wallets for spends
//   // Drop down menu of all wallets created by the user
// }

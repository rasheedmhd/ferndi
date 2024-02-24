import 'package:app/models/schemas.dart';
// import "package:realm/realm.dart";


final wallets = realm.all<Wallet>();
final categories = realm.all<Category>();
final duration = realm.all<Duration>();


// final incomeWalletStatus    = realm.query<Wallet>('name == \$0', ['Income']).firstOrNull;
// final flexibleWalletStatus  = realm.query<Wallet>('name == \$0', ['Flexible']).firstOrNull;
// final savingsWalletStatus   = realm.query<Wallet>('name == \$0', ['Savings']).firstOrNull;

// final income    = incomeWalletStatus == null ? Wallet(ObjectId(), "Income", 0)  
//                   : realm.query<Wallet>('name == \$0', ['Income']).firstOrNull;
// final savings   = savingsWalletStatus == null ? Wallet(ObjectId(), "Savings", 0) 
//                   : realm.query<Wallet>('name == \$0', ['Savings']).firstOrNull;
// final flexible  = flexibleWalletStatus == null ? Wallet(ObjectId(), "Flexible", 0)
//                   : realm.query<Wallet>('name == \$0', ['Flexible']).firstOrNull;


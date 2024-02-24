import 'package:app/models/schemas.dart';
import "package:realm/realm.dart" as r;


final wallets = realm.all<Wallet>();
final spends = realm.all<Spend>();
final categories = realm.all<Category>();
final duration = realm.all<Duration>();
final subscriptions = realm.all<Subscription>();
// for later feature
// final budgets = realm.all<Budget>;

final incomeWalletStatus    = realm.query<Wallet>('name == \$0', ['Income']).firstOrNull;
final flexibleWalletStatus  = realm.query<Wallet>('name == \$0', ['Flexible']).firstOrNull;
final savingsWalletStatus   = realm.query<Wallet>('name == \$0', ['Savings']).firstOrNull;

final income    = incomeWalletStatus == null ? Wallet(r.ObjectId(), "Income", 0)  
                  : realm.query<Wallet>('name == \$0', ['Income']).firstOrNull;
final savings   = savingsWalletStatus == null ? Wallet(r.ObjectId(), "Savings", 0) 
                  : realm.query<Wallet>('name == \$0', ['Savings']).firstOrNull;
final flexible  = flexibleWalletStatus == null ? Wallet(r.ObjectId(), "Flexible", 0)
                  : realm.query<Wallet>('name == \$0', ['Flexible']).firstOrNull;


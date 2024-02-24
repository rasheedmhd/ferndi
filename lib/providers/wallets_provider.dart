import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import 'package:app/utility/defaults/onb_wallets.dart';


// final income = wallets.isEmpty
//     ? Wallet(r.ObjectId(), "Income", 0)
//     : realm.query<Wallet>('name == \$0', ['Income']).firstOrNull;

// final sWallets = StreamProvider((ref) => realm.query<Wallet>('name == \$0', ['Income']).changes);

// final sWalletsNotifier = NotifierProvider<SWalletNotifier, Wallet>(SWalletNotifier.new);

// class SWalletNotifier extends Notifier<Wallet> {
//   @override
//   Wallet build() {
//     // return ref.watch(s_wallets).value?.results.toList() ?? [];
//     return ref.watch(sWallets);
//   }
// }

final wallets = StreamProvider((ref) => realm.all<Wallet>().changes);

final walletsNotifier =
    NotifierProvider<WalletNotifier, List<Wallet>>(WalletNotifier.new);

class WalletNotifier extends Notifier<List<Wallet>> {
  @override
  List<Wallet> build() {
    return ref.watch(wallets).value?.results.toList() ?? [];
  }

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

  void updateWallet(Wallet wallet) {
    realm.write(() {
      realm.add<Wallet>(wallet, update: true);
    });
  }

  void addWallets() {
    realm.write(() {
      realm.addAll(onboardWallets);
    });
  }
}

import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import 'package:app/utility/defaults/onb_wallets.dart';

final spendsByWallet = Provider.family<List<Spend>, String>((ref, walletName) {
  final spendsByWallet = realm.query<Spend>("wallet.name == \$0", [walletName]);
  return spendsByWallet.toList();
});

final spendsByWalletTotal = Provider.family<int, String>((ref, walletName) {
  return ref
      .watch(spendsByWallet(walletName))
      .map((spend) => (spend.amount))
      .fold(0, (value, element) => value + element);
});

final pi = Provider<int>((ref) {
  return ref
      .watch(walletsNotifier)
      .where((w) => w.name == "Income")
      .map((wallet) => wallet.balance)
      .toList()
      .fold(0, (value, element) => value + element);
});

final wb = Provider<int>((ref) {
  return ref
      .watch(walletsNotifier)
      .map((wallet) => wallet.balance)
      .toList()
      .fold(0, (value, element) => value + element);
});

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

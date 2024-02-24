import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import "package:realm/realm.dart";
import 'package:app/utility/defaults/onb_wallets.dart';


final selectedWallet = Provider.family<Wallet?, String>((ref, walletName) {
  // Since we already have a stream provider returning all wallets and all changes to the wallets table
  // in the database, we rely on the provider to get updated wallet information any time
  // By relying on the Wallets provided in real time we can query and get only the wallet we need
  // by matching on its name, returning the wallet or null if such a wallet doesn't exist yet.
  final selectedWalletStatus =  ref
      .watch(walletsNotifier)
      .where((w) => w.name == walletName).firstOrNull;

  late final getFirstWallet =  ref
      .watch(walletsNotifier)
      .where((w) => w.name == walletName).first;

  // With the information from above, the selectedWalletStatus, which returns a wallet or null we can
  // first check if we didn't get any wallet in which case we return a dummy Wallet, with the name 
  // that was provided and a 0 balance, but if we found a wallet, 
  // We now that there is a wallet that matches what we are searching for so we can do the 
  // querying to return the first wallet that matches the name with confidence that
  // RealmDb won't return a StateError that will crash the app.
  final wallet = selectedWalletStatus == null
      ? Wallet(ObjectId(), walletName, 0)
      : getFirstWallet;

  return wallet;
  
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

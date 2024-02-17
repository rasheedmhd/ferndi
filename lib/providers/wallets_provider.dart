import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';

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

}
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';

final spendsByWallet = Provider.family<List<Spend>, String>((ref, walletName) {
  final spendsByWallet = ref.watch(spendsNotifier)
  .where((wallet) => wallet.name == walletName);
  return spendsByWallet.toList();
});

final spendsByWalletTotal = Provider.family<int, String>((ref, walletName) {
  return ref
      .watch(spendsByWallet(walletName))
      .map((spend) => (spend.amount))
      .fold(0, (value, element) => value + element);
});


final tb = Provider<int>((ref) {
  return ref
      .watch(spendsNotifier)
      .map((spend) => spend.amount)
      .toList()
      .fold(0, (value, element) => value + element);
});

final _spendsStream = StreamProvider((ref) => realm.all<Spend>().changes);

final spendsNotifier =
    NotifierProvider<SpendNotifier, List<Spend>>(SpendNotifier.new);

class SpendNotifier extends Notifier<List<Spend>> {
  @override
  List<Spend> build() {
    return ref.watch(_spendsStream).value?.results.toList() ?? [];
  }

  // Create a new spend record and persist to db
  void recordSpend(Spend spend) {
    realm.write(() {
      realm.add(spend);
    });
  }

  void updateSpend(Spend spend) {
    realm.write(() {
      realm.add<Spend>(spend, update: true);
    });
  }

  void deleteSpend(Spend spend) {
    realm.write(() {
      realm.delete<Spend>(spend);
    });
  }
}





// final spends = realm.all<Spend>();

/// Mark: you can decide to use this but you'd have to deal with streams
// final spendsNotifier = StreamNotifierProvider<SpendNotifier, RealmResultsChanges<Spend>>(SpendNotifier.new);

// class SpendNotifier extends StreamNotifier<RealmResultsChanges<Spend>> {
//   final realm = Realm(Configuration.local([Spend.schema]));

//   @override
//   Stream<RealmResultsChanges<Spend>> build() {
//     /// You can modify this to use your queries
//     return realm.all<Spend>().changes;
//   }


  // Create a new spend record and persist to db
  // void recordSpend(Spend spend) {
  //   realm.write(() {
  //     realm.add(spend);
  //   });
  // }

  // void updateSpend(Spend spend) {
  //   realm.write(() {
  //     realm.add<Spend>(spend, update: true);
  //   });
  // }

  // void deleteSpend(Spend spend) {
  //   realm.write(() {
  //     realm.delete<Spend>(spend);
  //   });
  // }
// }

import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import 'package:intl/intl.dart';
import "package:realm/realm.dart";

final getSpend = Provider.family<Spend, ObjectId>((ref, id) {
  final spend =
      ref.watch(spendsNotifier).where((spend) => spend.id == id).first;
  return spend;
});

final spendsByWallet = Provider.family<List<Spend>, String>((ref, walletName) {
  final spendsByWallet = ref
      .watch(spendsNotifier)
      .where((spend) => spend.wallet?.name == walletName);
  return spendsByWallet.toList();
});

final filterSpends = Provider.family<List<Spend>, DateTime>((ref, filterDate) {
  final spendsByMonth = ref.watch(spendsNotifier).where((spend) =>
      spend.createdAt.year == filterDate.year &&
      spend.createdAt.month == filterDate.month);
  return spendsByMonth.toList();
});

int getWeekNumber(DateTime date) {
  // Create a DateFormat object with week of year pattern
  DateFormat formatter = DateFormat('w');

  // Format the given date and parse it as an integer
  return int.parse(formatter.format(date));
}

final filterSpendsWeek =
    Provider.family<List<Spend>, DateTime>((ref, filterDate) {
  final spendsByMonth = ref.watch(spendsNotifier).where((spend) =>
      spend.createdAt.year == filterDate.year &&
      spend.createdAt.month == filterDate.month &&
      spend.createdAt.weekday == filterDate.weekday);
  return spendsByMonth.toList();
});

final spendsByWalletTotal = Provider.family<double, String>((ref, walletName) {
  return ref
      .watch(spendsByWallet(walletName))
      .map((spend) => (spend.amount))
      .fold(0, (value, element) => value + element);
});

final tb = Provider.family<double, DateTime>((ref, filterDate) {
  return ref
      .watch(spendsNotifier)
      .where((spend) =>
          spend.createdAt.year == filterDate.year &&
          spend.createdAt.month == filterDate.month)
      .map((spend) => spend.amount)
      .toList()
      .fold(0, (value, element) => value + element);
});

// final tb = Provider<int>((ref) {
//   return ref
//       .watch(spendsNotifier)
//       .map((spend) => spend.amount)
//       .toList()
//       .fold(0, (value, element) => value + element);
// });

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

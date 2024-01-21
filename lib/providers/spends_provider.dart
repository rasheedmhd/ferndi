import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/utility/schema/methods.dart";

final spendsProvider = Provider((ref) {
  return spends;
});

final totalTransactionsProvider = Provider((ref) {
  return totalTransactions;
});

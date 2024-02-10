import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:app/utility/schema/methods.dart";
// import 'package:app/models/schemas.dart';
// import "package:realm/realm.dart";

final spendsProvider = StateProvider((ref) {
  return spends;
});

final spendsCountProvider = StateProvider((ref) {
  return spendsCount;
});

class SpendsCountNotifier extends StateNotifier<int> {
  SpendsCountNotifier() : super(0);

  int update(int count) {
    state = count;
    return state;
  }

  // // Create a new spend record and persist to db
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
}

final spendsCountNotifier = StateNotifierProvider<SpendsCountNotifier, int>(
  (ref) {
    return SpendsCountNotifier();
  },
);

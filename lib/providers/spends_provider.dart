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

// class spendsNotifier extends StateNotifier { //<RealmResults<Spend>> {
//   spendsNotifier() : super([]);

//   // Create a new spend record and persist to db
//   void recordSpend(Spend spend) {
//     realm.write(() {
//       realm.add(spend);
//     });
//   }

  // void updateSpend(Spend spend) {
  //   realm.write(() {
  //     realm.add<Spend>(spend, update: true);
  //   });
  // }
// }


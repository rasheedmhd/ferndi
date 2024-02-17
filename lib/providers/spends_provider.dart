import "package:flutter_riverpod/flutter_riverpod.dart";
// import "package:app/utility/schema/methods.dart";
import 'package:app/models/schemas.dart';
import "package:realm/realm.dart";

final spends = realm.all<Spend>();

// // final spendsProvider = StateProvider((ref) {
// //   return spends;
// // });

// final spendsCountProvider = StateProvider((ref) {
//   // return spendsCount;
// });

// class SpendsCountNotifier extends StateNotifier<int> {
//   SpendsCountNotifier() : super(0);

//   int update(int count) {
//     state = count;
//     return state;
//   }
// }

// final spendsCountNotifier = StateNotifierProvider<SpendsCountNotifier, int>(
//   (ref) {
//     return SpendsCountNotifier();
//   },
// );

// class SpendsNotifier extends StateNotifier<RealmResults<Spend>> {
//   SpendsNotifier() : super(spends);

//   // void update(Spend newSpend) {
//   //   // state = count;
//   //   state = [...state, newSpend] as RealmResults<Spend> ;
//   // }

//   // Create a new spend record and persist to db
//   void recordSpend(Spend spend) {
//     realm.write(() {
//       realm.add(spend);
//     });
//     // state = [...state, spend] as RealmResults<Spend>;
//   }

//   void updateSpend(Spend spend) {
//     realm.write(() {
//       realm.add<Spend>(spend, update: true);
//     });
//   }

//   void deleteSpend(Spend spend) {
//     realm.write(() {
//       realm.delete<Spend>(spend);
//     });
//   }
// }

// final spendsNotifier =
//     StateNotifierProvider<SpendsNotifier, RealmResults<Spend>>(
//   (ref) {
//     return SpendsNotifier();
//   },
// );

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:realm/realm.dart';
// import 'package:realmer/spend.dart';


/// Use this instead. I converted the stream to a RealmResults instance
final spendsNotifier = Provider<RealmResults<Spend>?>((ref) {
  return ref.watch(_spendsNotifier).value?.results;
});

/// Mark: you can decide to use this but you'd have to deal with streams
final _spendsNotifier = StreamNotifierProvider<SpendNotifier, RealmResultsChanges<Spend>>(SpendNotifier.new);

class SpendNotifier extends StreamNotifier<RealmResultsChanges<Spend>> {
  // final realm = Realm(Configuration.local([Spend.schema]));

  @override
  Stream<RealmResultsChanges<Spend>> build() {
    /// You can modify this to use your queries
    return realm.all<Spend>().changes;
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
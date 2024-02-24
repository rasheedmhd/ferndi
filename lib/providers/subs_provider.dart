import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import 'package:app/utility/defaults/onb_durations.dart';


// final tysb = Provider<int>((ref) {
//   return realm
//       .query<Subscription>('duration.name == \$0', ['year'])
//       .toList()
//       .map((sub) => (sub.amount))
//       .toList()
//       .fold(0, (value, element) => value + element);
// });
// final totsb = Provider<int>((ref) {
//   return realm
//       .query<Subscription>('duration.name == \$0', ['one time'])
//       .toList()
//       .map((sub) => (sub.amount))
//       .toList()
//       .fold(0, (value, element) => value + element);
// });

final subBalance = Provider<int>((ref) {
  return ref
      .watch(subscriptionsNotifier)
      .map((subscription) => subscription.amount)
      .toList()
      .fold(0, (value, element) => value + element);
});

// final tmsb = Provider<int>((ref) {
//   return ref
//       .watch(subscriptionsNotifier)
//       .where((sbs) => sbs.duration?.name == "month")
//       .map((subscription) => subscription.amount)
//       .toList()
//       .fold(0, (value, element) => value + element);
// });
final getSub = Provider.family<int, String>((ref, duration) {
  return ref
      .watch(subscriptionsNotifier)
      .where((sbs) => sbs.duration?.name == duration)
      .map((subscription) => subscription.amount)
      .toList()
      .fold(0, (value, element) => value + element);
});

final _subscriptions =
    StreamProvider((ref) => realm.all<Subscription>().changes);

final subscriptionsNotifier =
    NotifierProvider<SubscriptionNotifier, List<Subscription>>(
        SubscriptionNotifier.new);

class SubscriptionNotifier extends Notifier<List<Subscription>> {
  @override
  List<Subscription> build() {
    return ref.watch(_subscriptions).value?.results.toList() ?? [];
  }

  // Create a new spend record and persist to db
  void addSubscription(Subscription subscription) {
    realm.write(() {
      realm.add(subscription);
    });
  }

  void updateSubscription(Subscription subscription) {
    realm.write(() {
      realm.add<Subscription>(subscription, update: true);
    });
  }

  void deleteSubscription(Subscription subscription) {
    realm.write(() {
      realm.delete(subscription);
    });
  }

  void addDurations() {
    realm.write(() {
      realm.addAll(durations);
    });
  }
}

import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:app/models/schemas.dart';
import 'package:app/utility/defaults/onb_durations.dart';


final subscriptions =
    StreamProvider((ref) => realm.all<Subscription>().changes);

final subscriptionsNotifier =
    NotifierProvider<SubscriptionNotifier, List<Subscription>>(
        SubscriptionNotifier.new);

class SubscriptionNotifier extends Notifier<List<Subscription>> {
  @override
  List<Subscription> build() {
    return ref.watch(subscriptions).value?.results.toList() ?? [];
  }

  final totalMonthlySubscriptionsBalance = realm
      .query<Subscription>('duration.name == \$0', ['month'])
      .toList()
      .map((sub) => (sub.amount))
      .toList()
      .fold(0, (value, element) => value + element);
  final totalYearlySubscriptionsBalance = realm
      .query<Subscription>('duration.name == \$0', ['year'])
      .toList()
      .map((sub) => (sub.amount))
      .toList()
      .fold(0, (value, element) => value + element);
  final totalOneTimeSubscriptionsBalance = realm
      .query<Subscription>('duration.name == \$0', ['one time'])
      .toList()
      .map((sub) => (sub.amount))
      .toList()
      .fold(0, (value, element) => value + element);

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

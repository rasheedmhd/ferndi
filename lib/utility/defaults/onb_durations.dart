import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

// Create a bunch of Durations when getting onboard
final durations = <Duration>[
  Duration(ObjectId(), "month", DateTime.now()),
  Duration(ObjectId(), "year", DateTime.now()),
  Duration(ObjectId(), "one time", DateTime.now()),
];
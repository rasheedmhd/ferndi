import "package:realm/realm.dart";
import 'package:app/models/schemas.dart';

// Create  3 Duration items when getting user on board
final durations = <Duration>[
  Duration(ObjectId(), "month", DateTime.now()),
  Duration(ObjectId(), "year", DateTime.now()),
  Duration(ObjectId(), "one time", DateTime.now()),
];
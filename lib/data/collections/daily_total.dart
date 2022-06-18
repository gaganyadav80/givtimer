import 'package:isar/isar.dart';

part 'daily_total.g.dart';

/// `this` collection stores accumulated time of all the activities performed
/// daily. This will help to store the `productive` time each day utilised
/// by the user each day and a graph could be shown for that data.
@Collection()
class DailyProductiveTime {
  @Id()
  int id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('date')])
  late String userId;

  // @Index(unique: true)
  late DateTime date;

  int seconds = 0;
}

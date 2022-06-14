import 'package:givtimer/data/collections/activity_type.dart';
import 'package:isar/isar.dart';

part 'activity.g.dart';

/// `this` collection stores the activity total time for each day.
/// If a activity is performed twice in a day then the total time will
/// be stored in a single entry. This collections has a SINGLE entry for each
/// day PER activity.
@Collection()
class ActivityData {
  @Id()
  int id = Isar.autoIncrement;

  @Index()
  late DateTime date;

  late String name;

  @ActivityTypeConverter()
  late ActivityType type;

  late int seconds = 0;
}

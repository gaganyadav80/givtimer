import 'package:givtimer/data/collections/activity_type.dart';
import 'package:isar/isar.dart';

part 'daily_activity.g.dart';

/// This collection stores the activity total time for EACH day.
/// If a activity is performed twice in a day then the total time will
/// be stored in a single entry. This collections has a SINGLE entry for each
/// activity per day
@Collection()
class DailyActivityData {
  @Id()
  int id = Isar.autoIncrement;

  @Index(composite: [CompositeIndex('key')])
  late String userId;

  @Index()
  late DateTime date;

  late String key;

  @ActivityTypeConverter()
  late ActivityType type;

  late int seconds = 0;
}

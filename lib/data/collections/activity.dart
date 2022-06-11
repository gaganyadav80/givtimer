import 'package:givtimer/data/collections/activity_type.dart';
import 'package:isar/isar.dart';

part 'activity.g.dart';

@Collection()
class UserActivity {
  @Id()
  int? id;

  @Index(name: 'userId', composite: [CompositeIndex('type')])
  late String userId;

  late DateTime date;

  @Index(name: 'name', composite: [CompositeIndex('date')])
  late String name;

  @ActivityTypeConverter()
  late ActivityType type;

  int seconds = 0;
}

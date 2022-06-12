import 'package:givtimer/data/collections/activity_type.dart';
import 'package:isar/isar.dart';

part 'activity.g.dart';

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

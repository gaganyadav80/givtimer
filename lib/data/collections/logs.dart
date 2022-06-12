import 'package:givtimer/data/data.dart';
import 'package:isar/isar.dart';

part 'logs.g.dart';

@Collection()
class ActivityLogs {
  @Id()
  int id = Isar.autoIncrement;

  @Index()
  late DateTime date;

  late String name;

  @ActivityTypeConverter()
  late ActivityType type;

  late int seconds = 0;
}

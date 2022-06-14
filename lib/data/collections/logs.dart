import 'package:givtimer/data/data.dart';
import 'package:isar/isar.dart';

part 'logs.g.dart';

/// `this` collections stores the logs for the user of each activity performed
/// as per the Date and Time. If same activity is performed multiple times then
/// each of them will have a separate entry because the date will be same but
/// the time will be different for each activity.
///
/// Not usefull for anything but keeping it for now. Just for fun.
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
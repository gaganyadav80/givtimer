import 'package:givtimer/data/data.dart';
import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class UserActivity {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: true)
  late String userId;

  final data = IsarLinks<ActivityData>();
  final logs = IsarLinks<ActivityLogs>();
}

import 'package:givtimer/data/data.dart';
import 'package:isar/isar.dart';

part 'user.g.dart';

/// This collection contains the userId of each user and links other
/// collections to each user. The collections linked are the following
/// `ActivityData`, `ActivityLogs`, `DailyTotal`. Read more about them in their
/// docs.
@Collection()
class UserActivity {
  @Id()
  int id = Isar.autoIncrement;

  @Index(unique: true, caseSensitive: true)
  late String userId;

  final data = IsarLinks<ActivityData>();
  final logs = IsarLinks<ActivityLogs>();
  final daily = IsarLinks<DailyTotal>();
}

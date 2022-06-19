// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetActivityLogCollection on Isar {
  IsarCollection<ActivityLog> get activityLogs => getCollection();
}

const ActivityLogSchema = CollectionSchema(
  name: 'ActivityLog',
  schema:
      '{"name":"ActivityLog","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"key","type":"String"},{"name":"seconds","type":"Long"},{"name":"type","type":"Long"},{"name":"userId","type":"String"}],"indexes":[{"name":"date","unique":false,"properties":[{"name":"date","type":"Value","caseSensitive":false}]},{"name":"userId","unique":false,"properties":[{"name":"userId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0, 'key': 1, 'seconds': 2, 'type': 3, 'userId': 4},
  listProperties: {},
  indexIds: {'date': 0, 'userId': 1},
  indexValueTypes: {
    'date': [
      IndexValueType.long,
    ],
    'userId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _activityLogGetId,
  setId: _activityLogSetId,
  getLinks: _activityLogGetLinks,
  attachLinks: _activityLogAttachLinks,
  serializeNative: _activityLogSerializeNative,
  deserializeNative: _activityLogDeserializeNative,
  deserializePropNative: _activityLogDeserializePropNative,
  serializeWeb: _activityLogSerializeWeb,
  deserializeWeb: _activityLogDeserializeWeb,
  deserializePropWeb: _activityLogDeserializePropWeb,
  version: 3,
);

int? _activityLogGetId(ActivityLog object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _activityLogSetId(ActivityLog object, int id) {
  object.id = id;
}

List<IsarLinkBase> _activityLogGetLinks(ActivityLog object) {
  return [];
}

const _activityLogActivityTypeConverter = ActivityTypeConverter();

void _activityLogSerializeNative(
    IsarCollection<ActivityLog> collection,
    IsarRawObject rawObj,
    ActivityLog object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.date;
  final _date = value0;
  final value1 = object.key;
  final _key = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_key.length) as int;
  final value2 = object.seconds;
  final _seconds = value2;
  final value3 = _activityLogActivityTypeConverter.toIsar(object.type);
  final _type = value3;
  final value4 = object.userId;
  final _userId = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_userId.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _date);
  writer.writeBytes(offsets[1], _key);
  writer.writeLong(offsets[2], _seconds);
  writer.writeLong(offsets[3], _type);
  writer.writeBytes(offsets[4], _userId);
}

ActivityLog _activityLogDeserializeNative(
    IsarCollection<ActivityLog> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ActivityLog();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.key = reader.readString(offsets[1]);
  object.seconds = reader.readLong(offsets[2]);
  object.type =
      _activityLogActivityTypeConverter.fromIsar(reader.readLong(offsets[3]));
  object.userId = reader.readString(offsets[4]);
  return object;
}

P _activityLogDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (_activityLogActivityTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _activityLogSerializeWeb(
    IsarCollection<ActivityLog> collection, ActivityLog object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'seconds', object.seconds);
  IsarNative.jsObjectSet(
      jsObj, 'type', _activityLogActivityTypeConverter.toIsar(object.type));
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

ActivityLog _activityLogDeserializeWeb(
    IsarCollection<ActivityLog> collection, dynamic jsObj) {
  final object = ActivityLog();
  object.date = IsarNative.jsObjectGet(jsObj, 'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'date'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.key = IsarNative.jsObjectGet(jsObj, 'key') ?? '';
  object.seconds =
      IsarNative.jsObjectGet(jsObj, 'seconds') ?? double.negativeInfinity;
  object.type = _activityLogActivityTypeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity);
  object.userId = IsarNative.jsObjectGet(jsObj, 'userId') ?? '';
  return object;
}

P _activityLogDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'date':
      return (IsarNative.jsObjectGet(jsObj, 'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'date'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key') ?? '') as P;
    case 'seconds':
      return (IsarNative.jsObjectGet(jsObj, 'seconds') ??
          double.negativeInfinity) as P;
    case 'type':
      return (_activityLogActivityTypeConverter.fromIsar(
              IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity))
          as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _activityLogAttachLinks(IsarCollection col, int id, ActivityLog object) {}

extension ActivityLogQueryWhereSort
    on QueryBuilder<ActivityLog, ActivityLog, QWhere> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhere> anyDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'date'));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhere> anyUserId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'userId'));
  }
}

extension ActivityLogQueryWhere
    on QueryBuilder<ActivityLog, ActivityLog, QWhereClause> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'date',
      value: [date],
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> dateNotEqualTo(
      DateTime date) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'date',
        upper: [date],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'date',
        lower: [date],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'date',
        lower: [date],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'date',
        upper: [date],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'date',
      lower: [date],
      includeLower: include,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'date',
      upper: [date],
      includeUpper: include,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'date',
      lower: [lowerDate],
      includeLower: includeLower,
      upper: [upperDate],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'userId',
      value: [userId],
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterWhereClause> userIdNotEqualTo(
      String userId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId',
        upper: [userId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId',
        lower: [userId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId',
        lower: [userId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId',
        upper: [userId],
        includeUpper: false,
      ));
    }
  }
}

extension ActivityLogQueryFilter
    on QueryBuilder<ActivityLog, ActivityLog, QFilterCondition> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'date',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> secondsEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      secondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> secondsLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> secondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'seconds',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> typeEqualTo(
      ActivityType value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: _activityLogActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> typeGreaterThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: _activityLogActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> typeLessThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: _activityLogActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> typeBetween(
    ActivityType lower,
    ActivityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: _activityLogActivityTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _activityLogActivityTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> userIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      userIdGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> userIdLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> userIdBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'userId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> userIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ActivityLogQueryLinks
    on QueryBuilder<ActivityLog, ActivityLog, QFilterCondition> {}

extension ActivityLogQueryWhereSortBy
    on QueryBuilder<ActivityLog, ActivityLog, QSortBy> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> sortByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension ActivityLogQueryWhereSortThenBy
    on QueryBuilder<ActivityLog, ActivityLog, QSortThenBy> {
  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<ActivityLog, ActivityLog, QAfterSortBy> thenByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension ActivityLogQueryWhereDistinct
    on QueryBuilder<ActivityLog, ActivityLog, QDistinct> {
  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }

  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctBySeconds() {
    return addDistinctByInternal('seconds');
  }

  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctByType() {
    return addDistinctByInternal('type');
  }

  QueryBuilder<ActivityLog, ActivityLog, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userId', caseSensitive: caseSensitive);
  }
}

extension ActivityLogQueryProperty
    on QueryBuilder<ActivityLog, ActivityLog, QQueryProperty> {
  QueryBuilder<ActivityLog, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<ActivityLog, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ActivityLog, String, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<ActivityLog, int, QQueryOperations> secondsProperty() {
    return addPropertyNameInternal('seconds');
  }

  QueryBuilder<ActivityLog, ActivityType, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }

  QueryBuilder<ActivityLog, String, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}

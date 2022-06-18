// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDailyActivityDataCollection on Isar {
  IsarCollection<DailyActivityData> get dailyActivityDatas => getCollection();
}

const DailyActivityDataSchema = CollectionSchema(
  name: 'DailyActivityData',
  schema:
      '{"name":"DailyActivityData","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"name","type":"String"},{"name":"seconds","type":"Long"},{"name":"type","type":"Long"},{"name":"userId","type":"String"}],"indexes":[{"name":"userId_date","unique":false,"properties":[{"name":"userId","type":"Hash","caseSensitive":true},{"name":"date","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0, 'name': 1, 'seconds': 2, 'type': 3, 'userId': 4},
  listProperties: {},
  indexIds: {'userId_date': 0},
  indexValueTypes: {
    'userId_date': [
      IndexValueType.stringHash,
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _dailyActivityDataGetId,
  setId: _dailyActivityDataSetId,
  getLinks: _dailyActivityDataGetLinks,
  attachLinks: _dailyActivityDataAttachLinks,
  serializeNative: _dailyActivityDataSerializeNative,
  deserializeNative: _dailyActivityDataDeserializeNative,
  deserializePropNative: _dailyActivityDataDeserializePropNative,
  serializeWeb: _dailyActivityDataSerializeWeb,
  deserializeWeb: _dailyActivityDataDeserializeWeb,
  deserializePropWeb: _dailyActivityDataDeserializePropWeb,
  version: 3,
);

int? _dailyActivityDataGetId(DailyActivityData object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _dailyActivityDataSetId(DailyActivityData object, int id) {
  object.id = id;
}

List<IsarLinkBase> _dailyActivityDataGetLinks(DailyActivityData object) {
  return [];
}

const _dailyActivityDataActivityTypeConverter = ActivityTypeConverter();

void _dailyActivityDataSerializeNative(
    IsarCollection<DailyActivityData> collection,
    IsarRawObject rawObj,
    DailyActivityData object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.date;
  final _date = value0;
  final value1 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_name.length) as int;
  final value2 = object.seconds;
  final _seconds = value2;
  final value3 = _dailyActivityDataActivityTypeConverter.toIsar(object.type);
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
  writer.writeBytes(offsets[1], _name);
  writer.writeLong(offsets[2], _seconds);
  writer.writeLong(offsets[3], _type);
  writer.writeBytes(offsets[4], _userId);
}

DailyActivityData _dailyActivityDataDeserializeNative(
    IsarCollection<DailyActivityData> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DailyActivityData();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.seconds = reader.readLong(offsets[2]);
  object.type = _dailyActivityDataActivityTypeConverter
      .fromIsar(reader.readLong(offsets[3]));
  object.userId = reader.readString(offsets[4]);
  return object;
}

P _dailyActivityDataDeserializePropNative<P>(
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
      return (_dailyActivityDataActivityTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _dailyActivityDataSerializeWeb(
    IsarCollection<DailyActivityData> collection, DailyActivityData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'seconds', object.seconds);
  IsarNative.jsObjectSet(jsObj, 'type',
      _dailyActivityDataActivityTypeConverter.toIsar(object.type));
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

DailyActivityData _dailyActivityDataDeserializeWeb(
    IsarCollection<DailyActivityData> collection, dynamic jsObj) {
  final object = DailyActivityData();
  object.date = IsarNative.jsObjectGet(jsObj, 'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'date'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.seconds =
      IsarNative.jsObjectGet(jsObj, 'seconds') ?? double.negativeInfinity;
  object.type = _dailyActivityDataActivityTypeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity);
  object.userId = IsarNative.jsObjectGet(jsObj, 'userId') ?? '';
  return object;
}

P _dailyActivityDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
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
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'seconds':
      return (IsarNative.jsObjectGet(jsObj, 'seconds') ??
          double.negativeInfinity) as P;
    case 'type':
      return (_dailyActivityDataActivityTypeConverter.fromIsar(
              IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity))
          as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _dailyActivityDataAttachLinks(
    IsarCollection col, int id, DailyActivityData object) {}

extension DailyActivityDataQueryWhereSort
    on QueryBuilder<DailyActivityData, DailyActivityData, QWhere> {
  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhere>
      anyUserIdDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'userId_date'));
  }
}

extension DailyActivityDataQueryWhere
    on QueryBuilder<DailyActivityData, DailyActivityData, QWhereClause> {
  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      idNotEqualTo(int id) {
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'userId_date',
      value: [userId],
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId_date',
        upper: [userId],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId_date',
        lower: [userId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId_date',
        lower: [userId],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId_date',
        upper: [userId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdDateEqualTo(String userId, DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'userId_date',
      value: [userId, date],
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdDateNotEqualTo(String userId, DateTime date) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId_date',
        upper: [userId, date],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId_date',
        lower: [userId, date],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId_date',
        lower: [userId, date],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId_date',
        upper: [userId, date],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdEqualToDateGreaterThan(
    String userId,
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'userId_date',
      lower: [userId, date],
      includeLower: include,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdEqualToDateLessThan(
    String userId,
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'userId_date',
      upper: [userId, date],
      includeUpper: include,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterWhereClause>
      userIdEqualToDateBetween(
    String userId,
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'userId_date',
      lower: [userId, lowerDate],
      includeLower: includeLower,
      upper: [userId, upperDate],
      includeUpper: includeUpper,
    ));
  }
}

extension DailyActivityDataQueryFilter
    on QueryBuilder<DailyActivityData, DailyActivityData, QFilterCondition> {
  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      dateGreaterThan(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      dateLessThan(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      dateBetween(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      secondsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      secondsLessThan(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      secondsBetween(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      typeEqualTo(ActivityType value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: _dailyActivityDataActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      typeGreaterThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: _dailyActivityDataActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      typeLessThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: _dailyActivityDataActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      typeBetween(
    ActivityType lower,
    ActivityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: _dailyActivityDataActivityTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _dailyActivityDataActivityTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      userIdEqualTo(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      userIdLessThan(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      userIdBetween(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      userIdEndsWith(
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

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DailyActivityDataQueryLinks
    on QueryBuilder<DailyActivityData, DailyActivityData, QFilterCondition> {}

extension DailyActivityDataQueryWhereSortBy
    on QueryBuilder<DailyActivityData, DailyActivityData, QSortBy> {
  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      sortByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension DailyActivityDataQueryWhereSortThenBy
    on QueryBuilder<DailyActivityData, DailyActivityData, QSortThenBy> {
  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QAfterSortBy>
      thenByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension DailyActivityDataQueryWhereDistinct
    on QueryBuilder<DailyActivityData, DailyActivityData, QDistinct> {
  QueryBuilder<DailyActivityData, DailyActivityData, QDistinct>
      distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QDistinct>
      distinctBySeconds() {
    return addDistinctByInternal('seconds');
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QDistinct>
      distinctByType() {
    return addDistinctByInternal('type');
  }

  QueryBuilder<DailyActivityData, DailyActivityData, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return addDistinctByInternal('userId', caseSensitive: caseSensitive);
  }
}

extension DailyActivityDataQueryProperty
    on QueryBuilder<DailyActivityData, DailyActivityData, QQueryProperty> {
  QueryBuilder<DailyActivityData, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<DailyActivityData, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<DailyActivityData, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<DailyActivityData, int, QQueryOperations> secondsProperty() {
    return addPropertyNameInternal('seconds');
  }

  QueryBuilder<DailyActivityData, ActivityType, QQueryOperations>
      typeProperty() {
    return addPropertyNameInternal('type');
  }

  QueryBuilder<DailyActivityData, String, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}

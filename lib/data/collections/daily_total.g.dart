// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_total.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDailyProductiveTimeCollection on Isar {
  IsarCollection<DailyProductiveTime> get dailyProductiveTimes =>
      getCollection();
}

const DailyProductiveTimeSchema = CollectionSchema(
  name: 'DailyProductiveTime',
  schema:
      '{"name":"DailyProductiveTime","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"seconds","type":"Long"},{"name":"userId","type":"String"}],"indexes":[{"name":"date","unique":false,"properties":[{"name":"date","type":"Value","caseSensitive":false}]},{"name":"userId","unique":false,"properties":[{"name":"userId","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0, 'seconds': 1, 'userId': 2},
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
  getId: _dailyProductiveTimeGetId,
  setId: _dailyProductiveTimeSetId,
  getLinks: _dailyProductiveTimeGetLinks,
  attachLinks: _dailyProductiveTimeAttachLinks,
  serializeNative: _dailyProductiveTimeSerializeNative,
  deserializeNative: _dailyProductiveTimeDeserializeNative,
  deserializePropNative: _dailyProductiveTimeDeserializePropNative,
  serializeWeb: _dailyProductiveTimeSerializeWeb,
  deserializeWeb: _dailyProductiveTimeDeserializeWeb,
  deserializePropWeb: _dailyProductiveTimeDeserializePropWeb,
  version: 3,
);

int? _dailyProductiveTimeGetId(DailyProductiveTime object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _dailyProductiveTimeSetId(DailyProductiveTime object, int id) {
  object.id = id;
}

List<IsarLinkBase> _dailyProductiveTimeGetLinks(DailyProductiveTime object) {
  return [];
}

void _dailyProductiveTimeSerializeNative(
    IsarCollection<DailyProductiveTime> collection,
    IsarRawObject rawObj,
    DailyProductiveTime object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.date;
  final _date = value0;
  final value1 = object.seconds;
  final _seconds = value1;
  final value2 = object.userId;
  final _userId = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_userId.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _date);
  writer.writeLong(offsets[1], _seconds);
  writer.writeBytes(offsets[2], _userId);
}

DailyProductiveTime _dailyProductiveTimeDeserializeNative(
    IsarCollection<DailyProductiveTime> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = DailyProductiveTime();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.seconds = reader.readLong(offsets[1]);
  object.userId = reader.readString(offsets[2]);
  return object;
}

P _dailyProductiveTimeDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _dailyProductiveTimeSerializeWeb(
    IsarCollection<DailyProductiveTime> collection,
    DailyProductiveTime object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'seconds', object.seconds);
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

DailyProductiveTime _dailyProductiveTimeDeserializeWeb(
    IsarCollection<DailyProductiveTime> collection, dynamic jsObj) {
  final object = DailyProductiveTime();
  object.date = IsarNative.jsObjectGet(jsObj, 'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'date'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.seconds =
      IsarNative.jsObjectGet(jsObj, 'seconds') ?? double.negativeInfinity;
  object.userId = IsarNative.jsObjectGet(jsObj, 'userId') ?? '';
  return object;
}

P _dailyProductiveTimeDeserializePropWeb<P>(Object jsObj, String propertyName) {
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
    case 'seconds':
      return (IsarNative.jsObjectGet(jsObj, 'seconds') ??
          double.negativeInfinity) as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _dailyProductiveTimeAttachLinks(
    IsarCollection col, int id, DailyProductiveTime object) {}

extension DailyProductiveTimeQueryWhereSort
    on QueryBuilder<DailyProductiveTime, DailyProductiveTime, QWhere> {
  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhere>
      anyDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'date'));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhere>
      anyUserId() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'userId'));
  }
}

extension DailyProductiveTimeQueryWhere
    on QueryBuilder<DailyProductiveTime, DailyProductiveTime, QWhereClause> {
  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      dateEqualTo(DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'date',
      value: [date],
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'date',
      lower: [date],
      includeLower: include,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'date',
      upper: [date],
      includeUpper: include,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      dateBetween(
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      userIdEqualTo(String userId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'userId',
      value: [userId],
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterWhereClause>
      userIdNotEqualTo(String userId) {
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

extension DailyProductiveTimeQueryFilter on QueryBuilder<DailyProductiveTime,
    DailyProductiveTime, QFilterCondition> {
  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
      secondsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
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

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterFilterCondition>
      userIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'userId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DailyProductiveTimeQueryLinks on QueryBuilder<DailyProductiveTime,
    DailyProductiveTime, QFilterCondition> {}

extension DailyProductiveTimeQueryWhereSortBy
    on QueryBuilder<DailyProductiveTime, DailyProductiveTime, QSortBy> {
  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      sortByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension DailyProductiveTimeQueryWhereSortThenBy
    on QueryBuilder<DailyProductiveTime, DailyProductiveTime, QSortThenBy> {
  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QAfterSortBy>
      thenByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension DailyProductiveTimeQueryWhereDistinct
    on QueryBuilder<DailyProductiveTime, DailyProductiveTime, QDistinct> {
  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QDistinct>
      distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QDistinct>
      distinctBySeconds() {
    return addDistinctByInternal('seconds');
  }

  QueryBuilder<DailyProductiveTime, DailyProductiveTime, QDistinct>
      distinctByUserId({bool caseSensitive = true}) {
    return addDistinctByInternal('userId', caseSensitive: caseSensitive);
  }
}

extension DailyProductiveTimeQueryProperty
    on QueryBuilder<DailyProductiveTime, DailyProductiveTime, QQueryProperty> {
  QueryBuilder<DailyProductiveTime, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<DailyProductiveTime, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<DailyProductiveTime, int, QQueryOperations> secondsProperty() {
    return addPropertyNameInternal('seconds');
  }

  QueryBuilder<DailyProductiveTime, String, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}

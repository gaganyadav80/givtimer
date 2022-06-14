// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_total.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDailyTotalCollection on Isar {
  IsarCollection<DailyTotal> get dailyTotals => getCollection();
}

const DailyTotalSchema = CollectionSchema(
  name: 'DailyTotal',
  schema:
      '{"name":"DailyTotal","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"seconds","type":"Long"}],"indexes":[{"name":"date","unique":true,"properties":[{"name":"date","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0, 'seconds': 1},
  listProperties: {},
  indexIds: {'date': 0},
  indexValueTypes: {
    'date': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _dailyTotalGetId,
  setId: _dailyTotalSetId,
  getLinks: _dailyTotalGetLinks,
  attachLinks: _dailyTotalAttachLinks,
  serializeNative: _dailyTotalSerializeNative,
  deserializeNative: _dailyTotalDeserializeNative,
  deserializePropNative: _dailyTotalDeserializePropNative,
  serializeWeb: _dailyTotalSerializeWeb,
  deserializeWeb: _dailyTotalDeserializeWeb,
  deserializePropWeb: _dailyTotalDeserializePropWeb,
  version: 3,
);

int? _dailyTotalGetId(DailyTotal object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _dailyTotalSetId(DailyTotal object, int id) {
  object.id = id;
}

List<IsarLinkBase> _dailyTotalGetLinks(DailyTotal object) {
  return [];
}

void _dailyTotalSerializeNative(
    IsarCollection<DailyTotal> collection,
    IsarRawObject rawObj,
    DailyTotal object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.date;
  final _date = value0;
  final value1 = object.seconds;
  final _seconds = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _date);
  writer.writeLong(offsets[1], _seconds);
}

DailyTotal _dailyTotalDeserializeNative(IsarCollection<DailyTotal> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = DailyTotal();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.seconds = reader.readLong(offsets[1]);
  return object;
}

P _dailyTotalDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _dailyTotalSerializeWeb(
    IsarCollection<DailyTotal> collection, DailyTotal object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'seconds', object.seconds);
  return jsObj;
}

DailyTotal _dailyTotalDeserializeWeb(
    IsarCollection<DailyTotal> collection, dynamic jsObj) {
  final object = DailyTotal();
  object.date = IsarNative.jsObjectGet(jsObj, 'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'date'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.seconds =
      IsarNative.jsObjectGet(jsObj, 'seconds') ?? double.negativeInfinity;
  return object;
}

P _dailyTotalDeserializePropWeb<P>(Object jsObj, String propertyName) {
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
    default:
      throw 'Illegal propertyName';
  }
}

void _dailyTotalAttachLinks(IsarCollection col, int id, DailyTotal object) {}

extension DailyTotalByIndex on IsarCollection<DailyTotal> {
  Future<DailyTotal?> getByDate(DateTime date) {
    return getByIndex('date', [date]);
  }

  DailyTotal? getByDateSync(DateTime date) {
    return getByIndexSync('date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex('date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync('date', [date]);
  }

  Future<List<DailyTotal?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex('date', values);
  }

  List<DailyTotal?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync('date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex('date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('date', values);
  }
}

extension DailyTotalQueryWhereSort
    on QueryBuilder<DailyTotal, DailyTotal, QWhere> {
  QueryBuilder<DailyTotal, DailyTotal, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhere> anyDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'date'));
  }
}

extension DailyTotalQueryWhere
    on QueryBuilder<DailyTotal, DailyTotal, QWhereClause> {
  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> idBetween(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'date',
      value: [date],
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> dateNotEqualTo(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'date',
      lower: [date],
      includeLower: include,
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'date',
      upper: [date],
      includeUpper: include,
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterWhereClause> dateBetween(
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
}

extension DailyTotalQueryFilter
    on QueryBuilder<DailyTotal, DailyTotal, QFilterCondition> {
  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> secondsEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition>
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> secondsLessThan(
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

  QueryBuilder<DailyTotal, DailyTotal, QAfterFilterCondition> secondsBetween(
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
}

extension DailyTotalQueryLinks
    on QueryBuilder<DailyTotal, DailyTotal, QFilterCondition> {}

extension DailyTotalQueryWhereSortBy
    on QueryBuilder<DailyTotal, DailyTotal, QSortBy> {
  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> sortBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> sortBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }
}

extension DailyTotalQueryWhereSortThenBy
    on QueryBuilder<DailyTotal, DailyTotal, QSortThenBy> {
  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> thenBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<DailyTotal, DailyTotal, QAfterSortBy> thenBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }
}

extension DailyTotalQueryWhereDistinct
    on QueryBuilder<DailyTotal, DailyTotal, QDistinct> {
  QueryBuilder<DailyTotal, DailyTotal, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<DailyTotal, DailyTotal, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<DailyTotal, DailyTotal, QDistinct> distinctBySeconds() {
    return addDistinctByInternal('seconds');
  }
}

extension DailyTotalQueryProperty
    on QueryBuilder<DailyTotal, DailyTotal, QQueryProperty> {
  QueryBuilder<DailyTotal, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<DailyTotal, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<DailyTotal, int, QQueryOperations> secondsProperty() {
    return addPropertyNameInternal('seconds');
  }
}

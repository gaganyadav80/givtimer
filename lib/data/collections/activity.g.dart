// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetActivityDataCollection on Isar {
  IsarCollection<ActivityData> get activityDatas => getCollection();
}

const ActivityDataSchema = CollectionSchema(
  name: 'ActivityData',
  schema:
      '{"name":"ActivityData","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"name","type":"String"},{"name":"seconds","type":"Long"},{"name":"type","type":"Long"}],"indexes":[{"name":"date","unique":false,"properties":[{"name":"date","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0, 'name': 1, 'seconds': 2, 'type': 3},
  listProperties: {},
  indexIds: {'date': 0},
  indexValueTypes: {
    'date': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _activityDataGetId,
  setId: _activityDataSetId,
  getLinks: _activityDataGetLinks,
  attachLinks: _activityDataAttachLinks,
  serializeNative: _activityDataSerializeNative,
  deserializeNative: _activityDataDeserializeNative,
  deserializePropNative: _activityDataDeserializePropNative,
  serializeWeb: _activityDataSerializeWeb,
  deserializeWeb: _activityDataDeserializeWeb,
  deserializePropWeb: _activityDataDeserializePropWeb,
  version: 3,
);

int? _activityDataGetId(ActivityData object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _activityDataSetId(ActivityData object, int id) {
  object.id = id;
}

List<IsarLinkBase> _activityDataGetLinks(ActivityData object) {
  return [];
}

const _activityDataActivityTypeConverter = ActivityTypeConverter();

void _activityDataSerializeNative(
    IsarCollection<ActivityData> collection,
    IsarRawObject rawObj,
    ActivityData object,
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
  final value3 = _activityDataActivityTypeConverter.toIsar(object.type);
  final _type = value3;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _date);
  writer.writeBytes(offsets[1], _name);
  writer.writeLong(offsets[2], _seconds);
  writer.writeLong(offsets[3], _type);
}

ActivityData _activityDataDeserializeNative(
    IsarCollection<ActivityData> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ActivityData();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.seconds = reader.readLong(offsets[2]);
  object.type =
      _activityDataActivityTypeConverter.fromIsar(reader.readLong(offsets[3]));
  return object;
}

P _activityDataDeserializePropNative<P>(
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
      return (_activityDataActivityTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _activityDataSerializeWeb(
    IsarCollection<ActivityData> collection, ActivityData object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'seconds', object.seconds);
  IsarNative.jsObjectSet(
      jsObj, 'type', _activityDataActivityTypeConverter.toIsar(object.type));
  return jsObj;
}

ActivityData _activityDataDeserializeWeb(
    IsarCollection<ActivityData> collection, dynamic jsObj) {
  final object = ActivityData();
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
  object.type = _activityDataActivityTypeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity);
  return object;
}

P _activityDataDeserializePropWeb<P>(Object jsObj, String propertyName) {
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
      return (_activityDataActivityTypeConverter.fromIsar(
              IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity))
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _activityDataAttachLinks(
    IsarCollection col, int id, ActivityData object) {}

extension ActivityDataQueryWhereSort
    on QueryBuilder<ActivityData, ActivityData, QWhere> {
  QueryBuilder<ActivityData, ActivityData, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhere> anyDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'date'));
  }
}

extension ActivityDataQueryWhere
    on QueryBuilder<ActivityData, ActivityData, QWhereClause> {
  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> idBetween(
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

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'date',
      value: [date],
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> dateNotEqualTo(
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

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'date',
      lower: [date],
      includeLower: include,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'date',
      upper: [date],
      includeUpper: include,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterWhereClause> dateBetween(
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

extension ActivityDataQueryFilter
    on QueryBuilder<ActivityData, ActivityData, QFilterCondition> {
  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
      secondsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
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

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> typeEqualTo(
      ActivityType value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: _activityDataActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition>
      typeGreaterThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: _activityDataActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> typeLessThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: _activityDataActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<ActivityData, ActivityData, QAfterFilterCondition> typeBetween(
    ActivityType lower,
    ActivityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: _activityDataActivityTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _activityDataActivityTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }
}

extension ActivityDataQueryLinks
    on QueryBuilder<ActivityData, ActivityData, QFilterCondition> {}

extension ActivityDataQueryWhereSortBy
    on QueryBuilder<ActivityData, ActivityData, QSortBy> {
  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension ActivityDataQueryWhereSortThenBy
    on QueryBuilder<ActivityData, ActivityData, QSortThenBy> {
  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<ActivityData, ActivityData, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension ActivityDataQueryWhereDistinct
    on QueryBuilder<ActivityData, ActivityData, QDistinct> {
  QueryBuilder<ActivityData, ActivityData, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<ActivityData, ActivityData, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ActivityData, ActivityData, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<ActivityData, ActivityData, QDistinct> distinctBySeconds() {
    return addDistinctByInternal('seconds');
  }

  QueryBuilder<ActivityData, ActivityData, QDistinct> distinctByType() {
    return addDistinctByInternal('type');
  }
}

extension ActivityDataQueryProperty
    on QueryBuilder<ActivityData, ActivityData, QQueryProperty> {
  QueryBuilder<ActivityData, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<ActivityData, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ActivityData, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<ActivityData, int, QQueryOperations> secondsProperty() {
    return addPropertyNameInternal('seconds');
  }

  QueryBuilder<ActivityData, ActivityType, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }
}

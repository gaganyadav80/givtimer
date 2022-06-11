// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetUserActivityCollection on Isar {
  IsarCollection<UserActivity> get userActivitys => getCollection();
}

const UserActivitySchema = CollectionSchema(
  name: 'UserActivity',
  schema:
      '{"name":"UserActivity","idName":"id","properties":[{"name":"date","type":"Long"},{"name":"name","type":"String"},{"name":"seconds","type":"Long"},{"name":"type","type":"Long"},{"name":"userId","type":"String"}],"indexes":[{"name":"name","unique":false,"properties":[{"name":"name","type":"Hash","caseSensitive":true},{"name":"date","type":"Value","caseSensitive":false}]},{"name":"userId","unique":false,"properties":[{"name":"userId","type":"Hash","caseSensitive":true},{"name":"type","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'date': 0, 'name': 1, 'seconds': 2, 'type': 3, 'userId': 4},
  listProperties: {},
  indexIds: {'name': 0, 'userId': 1},
  indexValueTypes: {
    'name': [
      IndexValueType.stringHash,
      IndexValueType.long,
    ],
    'userId': [
      IndexValueType.stringHash,
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _userActivityGetId,
  setId: _userActivitySetId,
  getLinks: _userActivityGetLinks,
  attachLinks: _userActivityAttachLinks,
  serializeNative: _userActivitySerializeNative,
  deserializeNative: _userActivityDeserializeNative,
  deserializePropNative: _userActivityDeserializePropNative,
  serializeWeb: _userActivitySerializeWeb,
  deserializeWeb: _userActivityDeserializeWeb,
  deserializePropWeb: _userActivityDeserializePropWeb,
  version: 3,
);

int? _userActivityGetId(UserActivity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _userActivitySetId(UserActivity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _userActivityGetLinks(UserActivity object) {
  return [];
}

const _userActivityActivityTypeConverter = ActivityTypeConverter();

void _userActivitySerializeNative(
    IsarCollection<UserActivity> collection,
    IsarRawObject rawObj,
    UserActivity object,
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
  final value3 = _userActivityActivityTypeConverter.toIsar(object.type);
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

UserActivity _userActivityDeserializeNative(
    IsarCollection<UserActivity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = UserActivity();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.seconds = reader.readLong(offsets[2]);
  object.type =
      _userActivityActivityTypeConverter.fromIsar(reader.readLong(offsets[3]));
  object.userId = reader.readString(offsets[4]);
  return object;
}

P _userActivityDeserializePropNative<P>(
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
      return (_userActivityActivityTypeConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _userActivitySerializeWeb(
    IsarCollection<UserActivity> collection, UserActivity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'date', object.date.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'seconds', object.seconds);
  IsarNative.jsObjectSet(
      jsObj, 'type', _userActivityActivityTypeConverter.toIsar(object.type));
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

UserActivity _userActivityDeserializeWeb(
    IsarCollection<UserActivity> collection, dynamic jsObj) {
  final object = UserActivity();
  object.date = IsarNative.jsObjectGet(jsObj, 'date') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'date'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.seconds =
      IsarNative.jsObjectGet(jsObj, 'seconds') ?? double.negativeInfinity;
  object.type = _userActivityActivityTypeConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity);
  object.userId = IsarNative.jsObjectGet(jsObj, 'userId') ?? '';
  return object;
}

P _userActivityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'date':
      return (IsarNative.jsObjectGet(jsObj, 'date') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'date'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'seconds':
      return (IsarNative.jsObjectGet(jsObj, 'seconds') ??
          double.negativeInfinity) as P;
    case 'type':
      return (_userActivityActivityTypeConverter.fromIsar(
              IsarNative.jsObjectGet(jsObj, 'type') ?? double.negativeInfinity))
          as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _userActivityAttachLinks(
    IsarCollection col, int id, UserActivity object) {}

extension UserActivityQueryWhereSort
    on QueryBuilder<UserActivity, UserActivity, QWhere> {
  QueryBuilder<UserActivity, UserActivity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhere> anyNameDate() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'name'));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhere> anyUserIdType() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'userId'));
  }
}

extension UserActivityQueryWhere
    on QueryBuilder<UserActivity, UserActivity, QWhereClause> {
  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> idBetween(
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

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> nameEqualTo(
      String name) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'name',
      value: [name],
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> nameNotEqualTo(
      String name) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> nameDateEqualTo(
      String name, DateTime date) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'name',
      value: [name, date],
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      nameDateNotEqualTo(String name, DateTime date) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name, date],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name, date],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'name',
        lower: [name, date],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'name',
        upper: [name, date],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      nameEqualToDateGreaterThan(
    String name,
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'name',
      lower: [name, date],
      includeLower: include,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      nameEqualToDateLessThan(
    String name,
    DateTime date, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'name',
      upper: [name, date],
      includeUpper: include,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      nameEqualToDateBetween(
    String name,
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'name',
      lower: [name, lowerDate],
      includeLower: includeLower,
      upper: [name, upperDate],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> userIdEqualTo(
      String userId) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'userId',
      value: [userId],
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> userIdNotEqualTo(
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

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause> userIdTypeEqualTo(
      String userId, ActivityType type) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'userId',
      value: [userId, _userActivityActivityTypeConverter.toIsar(type)],
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      userIdTypeNotEqualTo(String userId, ActivityType type) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId',
        upper: [userId, _userActivityActivityTypeConverter.toIsar(type)],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId',
        lower: [userId, _userActivityActivityTypeConverter.toIsar(type)],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'userId',
        lower: [userId, _userActivityActivityTypeConverter.toIsar(type)],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'userId',
        upper: [userId, _userActivityActivityTypeConverter.toIsar(type)],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      userIdEqualToTypeGreaterThan(
    String userId,
    ActivityType type, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.greaterThan(
      indexName: 'userId',
      lower: [userId, _userActivityActivityTypeConverter.toIsar(type)],
      includeLower: include,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      userIdEqualToTypeLessThan(
    String userId,
    ActivityType type, {
    bool include = false,
  }) {
    return addWhereClauseInternal(IndexWhereClause.lessThan(
      indexName: 'userId',
      upper: [userId, _userActivityActivityTypeConverter.toIsar(type)],
      includeUpper: include,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhereClause>
      userIdEqualToTypeBetween(
    String userId,
    ActivityType lowerType,
    ActivityType upperType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IndexWhereClause.between(
      indexName: 'userId',
      lower: [userId, lowerType],
      includeLower: includeLower,
      upper: [userId, upperType],
      includeUpper: includeUpper,
    ));
  }
}

extension UserActivityQueryFilter
    on QueryBuilder<UserActivity, UserActivity, QFilterCondition> {
  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'date',
      value: value,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
      secondsEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'seconds',
      value: value,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> typeEqualTo(
      ActivityType value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: _userActivityActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
      typeGreaterThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: _userActivityActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> typeLessThan(
    ActivityType value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: _userActivityActivityTypeConverter.toIsar(value),
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> typeBetween(
    ActivityType lower,
    ActivityType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: _userActivityActivityTypeConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _userActivityActivityTypeConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> userIdEqualTo(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
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

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'userId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> userIdMatches(
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

extension UserActivityQueryLinks
    on QueryBuilder<UserActivity, UserActivity, QFilterCondition> {}

extension UserActivityQueryWhereSortBy
    on QueryBuilder<UserActivity, UserActivity, QSortBy> {
  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension UserActivityQueryWhereSortThenBy
    on QueryBuilder<UserActivity, UserActivity, QSortThenBy> {
  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByDate() {
    return addSortByInternal('date', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByDateDesc() {
    return addSortByInternal('date', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenBySeconds() {
    return addSortByInternal('seconds', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenBySecondsDesc() {
    return addSortByInternal('seconds', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByUserId() {
    return addSortByInternal('userId', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByUserIdDesc() {
    return addSortByInternal('userId', Sort.desc);
  }
}

extension UserActivityQueryWhereDistinct
    on QueryBuilder<UserActivity, UserActivity, QDistinct> {
  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctByDate() {
    return addDistinctByInternal('date');
  }

  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctBySeconds() {
    return addDistinctByInternal('seconds');
  }

  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctByType() {
    return addDistinctByInternal('type');
  }

  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userId', caseSensitive: caseSensitive);
  }
}

extension UserActivityQueryProperty
    on QueryBuilder<UserActivity, UserActivity, QQueryProperty> {
  QueryBuilder<UserActivity, DateTime, QQueryOperations> dateProperty() {
    return addPropertyNameInternal('date');
  }

  QueryBuilder<UserActivity, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<UserActivity, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<UserActivity, int, QQueryOperations> secondsProperty() {
    return addPropertyNameInternal('seconds');
  }

  QueryBuilder<UserActivity, ActivityType, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }

  QueryBuilder<UserActivity, String, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}

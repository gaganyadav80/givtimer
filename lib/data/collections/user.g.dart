// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
      '{"name":"UserActivity","idName":"id","properties":[{"name":"userId","type":"String"}],"indexes":[{"name":"userId","unique":true,"properties":[{"name":"userId","type":"Hash","caseSensitive":true}]}],"links":[{"name":"daily","target":"DailyTotal"},{"name":"data","target":"ActivityData"},{"name":"logs","target":"ActivityLogs"}]}',
  idName: 'id',
  propertyIds: {'userId': 0},
  listProperties: {},
  indexIds: {'userId': 0},
  indexValueTypes: {
    'userId': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'daily': 0, 'data': 1, 'logs': 2},
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
  return [object.daily, object.data, object.logs];
}

void _userActivitySerializeNative(
    IsarCollection<UserActivity> collection,
    IsarRawObject rawObj,
    UserActivity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.userId;
  final _userId = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_userId.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _userId);
}

UserActivity _userActivityDeserializeNative(
    IsarCollection<UserActivity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = UserActivity();
  object.id = id;
  object.userId = reader.readString(offsets[0]);
  _userActivityAttachLinks(collection, id, object);
  return object;
}

P _userActivityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _userActivitySerializeWeb(
    IsarCollection<UserActivity> collection, UserActivity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'userId', object.userId);
  return jsObj;
}

UserActivity _userActivityDeserializeWeb(
    IsarCollection<UserActivity> collection, dynamic jsObj) {
  final object = UserActivity();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.userId = IsarNative.jsObjectGet(jsObj, 'userId') ?? '';
  _userActivityAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _userActivityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'userId':
      return (IsarNative.jsObjectGet(jsObj, 'userId') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _userActivityAttachLinks(IsarCollection col, int id, UserActivity object) {
  object.daily.attach(col, col.isar.dailyTotals, 'daily', id);
  object.data.attach(col, col.isar.activityDatas, 'data', id);
  object.logs.attach(col, col.isar.activityLogss, 'logs', id);
}

extension UserActivityByIndex on IsarCollection<UserActivity> {
  Future<UserActivity?> getByUserId(String userId) {
    return getByIndex('userId', [userId]);
  }

  UserActivity? getByUserIdSync(String userId) {
    return getByIndexSync('userId', [userId]);
  }

  Future<bool> deleteByUserId(String userId) {
    return deleteByIndex('userId', [userId]);
  }

  bool deleteByUserIdSync(String userId) {
    return deleteByIndexSync('userId', [userId]);
  }

  Future<List<UserActivity?>> getAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex('userId', values);
  }

  List<UserActivity?> getAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync('userId', values);
  }

  Future<int> deleteAllByUserId(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex('userId', values);
  }

  int deleteAllByUserIdSync(List<String> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('userId', values);
  }
}

extension UserActivityQueryWhereSort
    on QueryBuilder<UserActivity, UserActivity, QWhere> {
  QueryBuilder<UserActivity, UserActivity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<UserActivity, UserActivity, QAfterWhere> anyUserId() {
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
}

extension UserActivityQueryFilter
    on QueryBuilder<UserActivity, UserActivity, QFilterCondition> {
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
    on QueryBuilder<UserActivity, UserActivity, QFilterCondition> {
  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> daily(
      FilterQuery<DailyTotal> q) {
    return linkInternal(
      isar.dailyTotals,
      q,
      'daily',
    );
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> data(
      FilterQuery<ActivityData> q) {
    return linkInternal(
      isar.activityDatas,
      q,
      'data',
    );
  }

  QueryBuilder<UserActivity, UserActivity, QAfterFilterCondition> logs(
      FilterQuery<ActivityLogs> q) {
    return linkInternal(
      isar.activityLogss,
      q,
      'logs',
    );
  }
}

extension UserActivityQueryWhereSortBy
    on QueryBuilder<UserActivity, UserActivity, QSortBy> {
  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
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
  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserActivity, UserActivity, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
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
  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<UserActivity, UserActivity, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('userId', caseSensitive: caseSensitive);
  }
}

extension UserActivityQueryProperty
    on QueryBuilder<UserActivity, UserActivity, QQueryProperty> {
  QueryBuilder<UserActivity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<UserActivity, String, QQueryOperations> userIdProperty() {
    return addPropertyNameInternal('userId');
  }
}

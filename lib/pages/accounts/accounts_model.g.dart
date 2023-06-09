// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAccountsModelCollection on Isar {
  IsarCollection<AccountsModel> get accountsModels => this.collection();
}

const AccountsModelSchema = CollectionSchema(
  name: r'AccountsModel',
  id: 8289987660091086804,
  properties: {
    r'account': PropertySchema(
      id: 0,
      name: r'account',
      type: IsarType.string,
    ),
    r'accountBook': PropertySchema(
      id: 1,
      name: r'accountBook',
      type: IsarType.string,
    ),
    r'amount': PropertySchema(
      id: 2,
      name: r'amount',
      type: IsarType.double,
    ),
    r'createDT': PropertySchema(
      id: 3,
      name: r'createDT',
      type: IsarType.dateTime,
    ),
    r'isNotCount': PropertySchema(
      id: 4,
      name: r'isNotCount',
      type: IsarType.bool,
    ),
    r'isReimbursed': PropertySchema(
      id: 5,
      name: r'isReimbursed',
      type: IsarType.bool,
    ),
    r'location': PropertySchema(
      id: 6,
      name: r'location',
      type: IsarType.string,
    ),
    r'memo': PropertySchema(
      id: 7,
      name: r'memo',
      type: IsarType.string,
    ),
    r'tag': PropertySchema(
      id: 8,
      name: r'tag',
      type: IsarType.stringList,
    ),
    r'updateDT': PropertySchema(
      id: 9,
      name: r'updateDT',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _accountsModelEstimateSize,
  serialize: _accountsModelSerialize,
  deserialize: _accountsModelDeserialize,
  deserializeProp: _accountsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'icon': LinkSchema(
      id: -6876923934791953116,
      name: r'icon',
      target: r'IconAssetModel',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _accountsModelGetId,
  getLinks: _accountsModelGetLinks,
  attach: _accountsModelAttach,
  version: '3.1.0+1',
);

int _accountsModelEstimateSize(
  AccountsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.account;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.accountBook;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.location;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.memo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tag;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _accountsModelSerialize(
  AccountsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.account);
  writer.writeString(offsets[1], object.accountBook);
  writer.writeDouble(offsets[2], object.amount);
  writer.writeDateTime(offsets[3], object.createDT);
  writer.writeBool(offsets[4], object.isNotCount);
  writer.writeBool(offsets[5], object.isReimbursed);
  writer.writeString(offsets[6], object.location);
  writer.writeString(offsets[7], object.memo);
  writer.writeStringList(offsets[8], object.tag);
  writer.writeDateTime(offsets[9], object.updateDT);
}

AccountsModel _accountsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AccountsModel();
  object.account = reader.readStringOrNull(offsets[0]);
  object.accountBook = reader.readStringOrNull(offsets[1]);
  object.amount = reader.readDouble(offsets[2]);
  object.createDT = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.isNotCount = reader.readBool(offsets[4]);
  object.isReimbursed = reader.readBool(offsets[5]);
  object.location = reader.readStringOrNull(offsets[6]);
  object.memo = reader.readStringOrNull(offsets[7]);
  object.tag = reader.readStringList(offsets[8]);
  object.updateDT = reader.readDateTimeOrNull(offsets[9]);
  return object;
}

P _accountsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _accountsModelGetId(AccountsModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _accountsModelGetLinks(AccountsModel object) {
  return [object.icon];
}

void _accountsModelAttach(
    IsarCollection<dynamic> col, Id id, AccountsModel object) {
  object.id = id;
  object.icon.attach(col, col.isar.collection<IconAssetModel>(), r'icon', id);
}

extension AccountsModelQueryWhereSort
    on QueryBuilder<AccountsModel, AccountsModel, QWhere> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AccountsModelQueryWhere
    on QueryBuilder<AccountsModel, AccountsModel, QWhereClause> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AccountsModelQueryFilter
    on QueryBuilder<AccountsModel, AccountsModel, QFilterCondition> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'account',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'account',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'account',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'account',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'account',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'account',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'account',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'account',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'account',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'account',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'account',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'account',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'accountBook',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'accountBook',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountBook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accountBook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accountBook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accountBook',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'accountBook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'accountBook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'accountBook',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'accountBook',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accountBook',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      accountBookIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'accountBook',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      createDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      createDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createDT',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      createDTEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      createDTGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      createDTLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      createDTBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      isNotCountEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isNotCount',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      isReimbursedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isReimbursed',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'location',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'location',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'location',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'location',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      locationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'location',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'memo',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'memo',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> memoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> memoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> memoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      memoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memo',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tag',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tag',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tag',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tag',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tag',
        value: '',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tag',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tag',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tag',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tag',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tag',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      tagLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tag',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      updateDTIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      updateDTIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updateDT',
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      updateDTEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      updateDTGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      updateDTLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      updateDTBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AccountsModelQueryObject
    on QueryBuilder<AccountsModel, AccountsModel, QFilterCondition> {}

extension AccountsModelQueryLinks
    on QueryBuilder<AccountsModel, AccountsModel, QFilterCondition> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition> icon(
      FilterQuery<IconAssetModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'icon');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterFilterCondition>
      iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'icon', 0, true, 0, true);
    });
  }
}

extension AccountsModelQuerySortBy
    on QueryBuilder<AccountsModel, AccountsModel, QSortBy> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'account', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'account', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByAccountBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountBook', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByAccountBookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountBook', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByIsNotCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotCount', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByIsNotCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotCount', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByIsReimbursed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReimbursed', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByIsReimbursedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReimbursed', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension AccountsModelQuerySortThenBy
    on QueryBuilder<AccountsModel, AccountsModel, QSortThenBy> {
  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'account', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'account', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByAccountBook() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountBook', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByAccountBookDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountBook', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByIsNotCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotCount', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByIsNotCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isNotCount', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByIsReimbursed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReimbursed', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByIsReimbursedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isReimbursed', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByMemo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByMemoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'memo', Sort.desc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QAfterSortBy>
      thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension AccountsModelQueryWhereDistinct
    on QueryBuilder<AccountsModel, AccountsModel, QDistinct> {
  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByAccount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'account', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByAccountBook(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountBook', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByIsNotCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isNotCount');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct>
      distinctByIsReimbursed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isReimbursed');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByMemo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tag');
    });
  }

  QueryBuilder<AccountsModel, AccountsModel, QDistinct> distinctByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT');
    });
  }
}

extension AccountsModelQueryProperty
    on QueryBuilder<AccountsModel, AccountsModel, QQueryProperty> {
  QueryBuilder<AccountsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> accountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'account');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> accountBookProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountBook');
    });
  }

  QueryBuilder<AccountsModel, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<AccountsModel, DateTime?, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<AccountsModel, bool, QQueryOperations> isNotCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isNotCount');
    });
  }

  QueryBuilder<AccountsModel, bool, QQueryOperations> isReimbursedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isReimbursed');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> locationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<AccountsModel, String?, QQueryOperations> memoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memo');
    });
  }

  QueryBuilder<AccountsModel, List<String>?, QQueryOperations> tagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tag');
    });
  }

  QueryBuilder<AccountsModel, DateTime?, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIconAssetModelCollection on Isar {
  IsarCollection<IconAssetModel> get iconAssetModels => this.collection();
}

const IconAssetModelSchema = CollectionSchema(
  name: r'IconAssetModel',
  id: -8291874077661641011,
  properties: {
    r'assetPath': PropertySchema(
      id: 0,
      name: r'assetPath',
      type: IsarType.string,
    ),
    r'createDT': PropertySchema(
      id: 1,
      name: r'createDT',
      type: IsarType.dateTime,
    ),
    r'iconCategory': PropertySchema(
      id: 2,
      name: r'iconCategory',
      type: IsarType.string,
      enumMap: _IconAssetModeliconCategoryEnumValueMap,
    ),
    r'iconType': PropertySchema(
      id: 3,
      name: r'iconType',
      type: IsarType.string,
      enumMap: _IconAssetModeliconTypeEnumValueMap,
    ),
    r'index': PropertySchema(
      id: 4,
      name: r'index',
      type: IsarType.long,
    ),
    r'isCustomized': PropertySchema(
      id: 5,
      name: r'isCustomized',
      type: IsarType.bool,
    ),
    r'isInUse': PropertySchema(
      id: 6,
      name: r'isInUse',
      type: IsarType.bool,
    ),
    r'memos': PropertySchema(
      id: 7,
      name: r'memos',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 9,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'updateDT': PropertySchema(
      id: 10,
      name: r'updateDT',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _iconAssetModelEstimateSize,
  serialize: _iconAssetModelSerialize,
  deserialize: _iconAssetModelDeserialize,
  deserializeProp: _iconAssetModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _iconAssetModelGetId,
  getLinks: _iconAssetModelGetLinks,
  attach: _iconAssetModelAttach,
  version: '3.1.0+1',
);

int _iconAssetModelEstimateSize(
  IconAssetModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.assetPath.length * 3;
  bytesCount += 3 + object.iconCategory.name.length * 3;
  bytesCount += 3 + object.iconType.name.length * 3;
  {
    final list = object.memos;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _iconAssetModelSerialize(
  IconAssetModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.assetPath);
  writer.writeDateTime(offsets[1], object.createDT);
  writer.writeString(offsets[2], object.iconCategory.name);
  writer.writeString(offsets[3], object.iconType.name);
  writer.writeLong(offsets[4], object.index);
  writer.writeBool(offsets[5], object.isCustomized);
  writer.writeBool(offsets[6], object.isInUse);
  writer.writeStringList(offsets[7], object.memos);
  writer.writeString(offsets[8], object.name);
  writer.writeStringList(offsets[9], object.tags);
  writer.writeDateTime(offsets[10], object.updateDT);
}

IconAssetModel _iconAssetModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IconAssetModel();
  object.assetPath = reader.readString(offsets[0]);
  object.createDT = reader.readDateTime(offsets[1]);
  object.iconCategory = _IconAssetModeliconCategoryValueEnumMap[
          reader.readStringOrNull(offsets[2])] ??
      IconCategory.business;
  object.iconType = _IconAssetModeliconTypeValueEnumMap[
          reader.readStringOrNull(offsets[3])] ??
      IconType.expenses;
  object.id = id;
  object.index = reader.readLongOrNull(offsets[4]);
  object.isCustomized = reader.readBool(offsets[5]);
  object.isInUse = reader.readBool(offsets[6]);
  object.memos = reader.readStringList(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.tags = reader.readStringList(offsets[9]);
  object.updateDT = reader.readDateTime(offsets[10]);
  return object;
}

P _iconAssetModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (_IconAssetModeliconCategoryValueEnumMap[
              reader.readStringOrNull(offset)] ??
          IconCategory.business) as P;
    case 3:
      return (_IconAssetModeliconTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          IconType.expenses) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readStringList(offset)) as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IconAssetModeliconCategoryEnumValueMap = {
  r'business': r'business',
  r'entertainment': r'entertainment',
  r'family': r'family',
  r'food': r'food',
  r'income': r'income',
  r'medical': r'medical',
  r'shopping': r'shopping',
  r'skill': r'skill',
  r'sport': r'sport',
  r'traffic': r'traffic',
  r'others': r'others',
};
const _IconAssetModeliconCategoryValueEnumMap = {
  r'business': IconCategory.business,
  r'entertainment': IconCategory.entertainment,
  r'family': IconCategory.family,
  r'food': IconCategory.food,
  r'income': IconCategory.income,
  r'medical': IconCategory.medical,
  r'shopping': IconCategory.shopping,
  r'skill': IconCategory.skill,
  r'sport': IconCategory.sport,
  r'traffic': IconCategory.traffic,
  r'others': IconCategory.others,
};
const _IconAssetModeliconTypeEnumValueMap = {
  r'expenses': r'expenses',
  r'income': r'income',
};
const _IconAssetModeliconTypeValueEnumMap = {
  r'expenses': IconType.expenses,
  r'income': IconType.income,
};

Id _iconAssetModelGetId(IconAssetModel object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _iconAssetModelGetLinks(IconAssetModel object) {
  return [];
}

void _iconAssetModelAttach(
    IsarCollection<dynamic> col, Id id, IconAssetModel object) {
  object.id = id;
}

extension IconAssetModelQueryWhereSort
    on QueryBuilder<IconAssetModel, IconAssetModel, QWhere> {
  QueryBuilder<IconAssetModel, IconAssetModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IconAssetModelQueryWhere
    on QueryBuilder<IconAssetModel, IconAssetModel, QWhereClause> {
  QueryBuilder<IconAssetModel, IconAssetModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IconAssetModelQueryFilter
    on QueryBuilder<IconAssetModel, IconAssetModel, QFilterCondition> {
  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assetPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assetPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assetPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'assetPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'assetPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'assetPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'assetPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assetPath',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      assetPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'assetPath',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      createDTEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      createDTGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      createDTLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createDT',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      createDTBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryEqualTo(
    IconCategory value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryGreaterThan(
    IconCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryLessThan(
    IconCategory value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryBetween(
    IconCategory lower,
    IconCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeEqualTo(
    IconType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeGreaterThan(
    IconType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeLessThan(
    IconType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeBetween(
    IconType lower,
    IconType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconType',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      iconTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconType',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      indexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      indexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'index',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      indexEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      indexGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      indexLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'index',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      indexBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'index',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      isCustomizedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCustomized',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      isInUseEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInUse',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'memos',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'memos',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'memos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'memos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'memos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'memos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'memos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'memos',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'memos',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'memos',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'memos',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memos',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memos',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memos',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memos',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memos',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      memosLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'memos',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      updateDTEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      updateDTGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      updateDTLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateDT',
        value: value,
      ));
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterFilterCondition>
      updateDTBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateDT',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IconAssetModelQueryObject
    on QueryBuilder<IconAssetModel, IconAssetModel, QFilterCondition> {}

extension IconAssetModelQueryLinks
    on QueryBuilder<IconAssetModel, IconAssetModel, QFilterCondition> {}

extension IconAssetModelQuerySortBy
    on QueryBuilder<IconAssetModel, IconAssetModel, QSortBy> {
  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByAssetPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetPath', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByAssetPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetPath', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByIconCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCategory', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByIconCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCategory', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByIconType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconType', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByIconTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconType', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByIsCustomized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomized', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByIsCustomizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomized', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByIsInUse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInUse', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByIsInUseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInUse', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> sortByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      sortByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension IconAssetModelQuerySortThenBy
    on QueryBuilder<IconAssetModel, IconAssetModel, QSortThenBy> {
  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByAssetPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetPath', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByAssetPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assetPath', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByCreateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createDT', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByIconCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCategory', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByIconCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCategory', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByIconType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconType', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByIconTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconType', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'index', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByIsCustomized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomized', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByIsCustomizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCustomized', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByIsInUse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInUse', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByIsInUseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInUse', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy> thenByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.asc);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QAfterSortBy>
      thenByUpdateDTDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateDT', Sort.desc);
    });
  }
}

extension IconAssetModelQueryWhereDistinct
    on QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> {
  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByAssetPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assetPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByCreateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createDT');
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct>
      distinctByIconCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByIconType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'index');
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct>
      distinctByIsCustomized() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCustomized');
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByIsInUse() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInUse');
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByMemos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'memos');
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<IconAssetModel, IconAssetModel, QDistinct> distinctByUpdateDT() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateDT');
    });
  }
}

extension IconAssetModelQueryProperty
    on QueryBuilder<IconAssetModel, IconAssetModel, QQueryProperty> {
  QueryBuilder<IconAssetModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IconAssetModel, String, QQueryOperations> assetPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assetPath');
    });
  }

  QueryBuilder<IconAssetModel, DateTime, QQueryOperations> createDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createDT');
    });
  }

  QueryBuilder<IconAssetModel, IconCategory, QQueryOperations>
      iconCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconCategory');
    });
  }

  QueryBuilder<IconAssetModel, IconType, QQueryOperations> iconTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconType');
    });
  }

  QueryBuilder<IconAssetModel, int?, QQueryOperations> indexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'index');
    });
  }

  QueryBuilder<IconAssetModel, bool, QQueryOperations> isCustomizedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCustomized');
    });
  }

  QueryBuilder<IconAssetModel, bool, QQueryOperations> isInUseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInUse');
    });
  }

  QueryBuilder<IconAssetModel, List<String>?, QQueryOperations>
      memosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'memos');
    });
  }

  QueryBuilder<IconAssetModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IconAssetModel, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<IconAssetModel, DateTime, QQueryOperations> updateDTProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateDT');
    });
  }
}

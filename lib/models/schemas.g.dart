// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Duration extends _Duration
    with RealmEntity, RealmObjectBase, RealmObject {
  Duration(
    ObjectId id,
    String name,
    DateTime createdAt,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'createdAt', createdAt);
  }

  Duration._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  Stream<RealmObjectChanges<Duration>> get changes =>
      RealmObjectBase.getChanges<Duration>(this);

  @override
  Duration freeze() => RealmObjectBase.freezeObject<Duration>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Duration._);
    return const SchemaObject(ObjectType.realmObject, Duration, 'Duration', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
    ]);
  }
}

class Subscription extends _Subscription
    with RealmEntity, RealmObjectBase, RealmObject {
  Subscription(
    ObjectId id,
    String name,
    double amount,
    DateTime createdAt,
    DateTime chargeAt, {
    Duration? duration,
    Wallet? wallet,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'chargeAt', chargeAt);
    RealmObjectBase.set(this, 'duration', duration);
    RealmObjectBase.set(this, 'wallet', wallet);
  }

  Subscription._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  DateTime get chargeAt =>
      RealmObjectBase.get<DateTime>(this, 'chargeAt') as DateTime;
  @override
  set chargeAt(DateTime value) => RealmObjectBase.set(this, 'chargeAt', value);

  @override
  Duration? get duration =>
      RealmObjectBase.get<Duration>(this, 'duration') as Duration?;
  @override
  set duration(covariant Duration? value) =>
      RealmObjectBase.set(this, 'duration', value);

  @override
  Wallet? get wallet => RealmObjectBase.get<Wallet>(this, 'wallet') as Wallet?;
  @override
  set wallet(covariant Wallet? value) =>
      RealmObjectBase.set(this, 'wallet', value);

  @override
  Stream<RealmObjectChanges<Subscription>> get changes =>
      RealmObjectBase.getChanges<Subscription>(this);

  @override
  Subscription freeze() => RealmObjectBase.freezeObject<Subscription>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Subscription._);
    return const SchemaObject(
        ObjectType.realmObject, Subscription, 'Subscription', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('chargeAt', RealmPropertyType.timestamp),
      SchemaProperty('duration', RealmPropertyType.object,
          optional: true, linkTarget: 'Duration'),
      SchemaProperty('wallet', RealmPropertyType.object,
          optional: true, linkTarget: 'Wallet'),
    ]);
  }
}

class Wallet extends _Wallet with RealmEntity, RealmObjectBase, RealmObject {
  Wallet(
    ObjectId id,
    String name,
    double balance,
    DateTime createdAt, {
    Iterable<Spend> spends = const [],
    Iterable<Subscription> subscriptions = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'balance', balance);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set<RealmList<Spend>>(
        this, 'spends', RealmList<Spend>(spends));
    RealmObjectBase.set<RealmList<Subscription>>(
        this, 'subscriptions', RealmList<Subscription>(subscriptions));
  }

  Wallet._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  double get balance => RealmObjectBase.get<double>(this, 'balance') as double;
  @override
  set balance(double value) => RealmObjectBase.set(this, 'balance', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  RealmList<Spend> get spends =>
      RealmObjectBase.get<Spend>(this, 'spends') as RealmList<Spend>;
  @override
  set spends(covariant RealmList<Spend> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Subscription> get subscriptions =>
      RealmObjectBase.get<Subscription>(this, 'subscriptions')
          as RealmList<Subscription>;
  @override
  set subscriptions(covariant RealmList<Subscription> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Wallet>> get changes =>
      RealmObjectBase.getChanges<Wallet>(this);

  @override
  Wallet freeze() => RealmObjectBase.freezeObject<Wallet>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Wallet._);
    return const SchemaObject(ObjectType.realmObject, Wallet, 'Wallet', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('balance', RealmPropertyType.double),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('spends', RealmPropertyType.object,
          linkTarget: 'Spend', collectionType: RealmCollectionType.list),
      SchemaProperty('subscriptions', RealmPropertyType.object,
          linkTarget: 'Subscription', collectionType: RealmCollectionType.list),
    ]);
  }
}

class Spend extends _Spend with RealmEntity, RealmObjectBase, RealmObject {
  Spend(
    ObjectId id,
    String name,
    String notes,
    double amount,
    DateTime createdAt, {
    Wallet? wallet,
    Category? category,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'wallet', wallet);
    RealmObjectBase.set(this, 'category', category);
  }

  Spend._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get notes => RealmObjectBase.get<String>(this, 'notes') as String;
  @override
  set notes(String value) => RealmObjectBase.set(this, 'notes', value);

  @override
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  Wallet? get wallet => RealmObjectBase.get<Wallet>(this, 'wallet') as Wallet?;
  @override
  set wallet(covariant Wallet? value) =>
      RealmObjectBase.set(this, 'wallet', value);

  @override
  Category? get category =>
      RealmObjectBase.get<Category>(this, 'category') as Category?;
  @override
  set category(covariant Category? value) =>
      RealmObjectBase.set(this, 'category', value);

  @override
  RealmResults<Wallet> get linkedWallet {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<Wallet>(this, 'linkedWallet')
        as RealmResults<Wallet>;
  }

  @override
  set linkedWallet(covariant RealmResults<Wallet> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmResults<Category> get linkedCategory {
    if (!isManaged) {
      throw RealmError('Using backlinks is only possible for managed objects.');
    }
    return RealmObjectBase.get<Category>(this, 'linkedCategory')
        as RealmResults<Category>;
  }

  @override
  set linkedCategory(covariant RealmResults<Category> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Spend>> get changes =>
      RealmObjectBase.getChanges<Spend>(this);

  @override
  Spend freeze() => RealmObjectBase.freezeObject<Spend>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Spend._);
    return const SchemaObject(ObjectType.realmObject, Spend, 'Spend', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('notes', RealmPropertyType.string),
      SchemaProperty('amount', RealmPropertyType.double),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('wallet', RealmPropertyType.object,
          optional: true, linkTarget: 'Wallet'),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'Category'),
      SchemaProperty('linkedWallet', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'spends',
          collectionType: RealmCollectionType.list,
          linkTarget: 'Wallet'),
      SchemaProperty('linkedCategory', RealmPropertyType.linkingObjects,
          linkOriginProperty: 'category',
          collectionType: RealmCollectionType.list,
          linkTarget: 'Category'),
    ]);
  }
}

class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  Category(
    ObjectId id,
    String name,
    String emoji,
    String color,
    DateTime createdAt, {
    Iterable<Spend> category = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'emoji', emoji);
    RealmObjectBase.set(this, 'color', color);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set<RealmList<Spend>>(
        this, 'category', RealmList<Spend>(category));
  }

  Category._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get emoji => RealmObjectBase.get<String>(this, 'emoji') as String;
  @override
  set emoji(String value) => RealmObjectBase.set(this, 'emoji', value);

  @override
  String get color => RealmObjectBase.get<String>(this, 'color') as String;
  @override
  set color(String value) => RealmObjectBase.set(this, 'color', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  RealmList<Spend> get category =>
      RealmObjectBase.get<Spend>(this, 'category') as RealmList<Spend>;
  @override
  set category(covariant RealmList<Spend> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Category>> get changes =>
      RealmObjectBase.getChanges<Category>(this);

  @override
  Category freeze() => RealmObjectBase.freezeObject<Category>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Category._);
    return const SchemaObject(ObjectType.realmObject, Category, 'Category', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('emoji', RealmPropertyType.string),
      SchemaProperty('color', RealmPropertyType.string),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('category', RealmPropertyType.object,
          linkTarget: 'Spend', collectionType: RealmCollectionType.list),
    ]);
  }
}

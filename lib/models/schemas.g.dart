// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Duration extends _Duration
    with RealmEntity, RealmObjectBase, RealmObject {
  Duration(
    ObjectId id,
    String name,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
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
    ]);
  }
}

class Subscription extends _Subscription
    with RealmEntity, RealmObjectBase, RealmObject {
  Subscription(
    ObjectId id,
    String name,
    double amount, {
    Duration? duration,
    Wallet? wallet,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'amount', amount);
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
    double amount,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'amount', amount);
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
  double get amount => RealmObjectBase.get<double>(this, 'amount') as double;
  @override
  set amount(double value) => RealmObjectBase.set(this, 'amount', value);

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
      SchemaProperty('amount', RealmPropertyType.double),
    ]);
  }
}

class Spend extends _Spend with RealmEntity, RealmObjectBase, RealmObject {
  Spend(
    ObjectId id,
    String name,
    String notes,
    double amount,
    DateTime date, {
    Wallet? wallet,
    Category? category,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'notes', notes);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'date', date);
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
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

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
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('wallet', RealmPropertyType.object,
          optional: true, linkTarget: 'Wallet'),
      SchemaProperty('category', RealmPropertyType.object,
          optional: true, linkTarget: 'Category'),
    ]);
  }
}

class Category extends _Category
    with RealmEntity, RealmObjectBase, RealmObject {
  Category(
    ObjectId id,
    String name,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
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
    ]);
  }
}

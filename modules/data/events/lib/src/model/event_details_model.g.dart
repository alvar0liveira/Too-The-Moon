// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class EventDetailsModel extends _EventDetailsModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  EventDetailsModel(
    int id,
    String name,
    String description,
    String featureImage,
    String location,
    DateTime lastUpdated, {
    bool isFavourite = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<EventDetailsModel>({
        'isFavourite': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'featureImage', featureImage);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'lastUpdated', lastUpdated);
    RealmObjectBase.set(this, 'isFavourite', isFavourite);
  }

  EventDetailsModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => throw RealmUnsupportedSetError();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get featureImage =>
      RealmObjectBase.get<String>(this, 'featureImage') as String;
  @override
  set featureImage(String value) =>
      RealmObjectBase.set(this, 'featureImage', value);

  @override
  String get location =>
      RealmObjectBase.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObjectBase.set(this, 'location', value);

  @override
  DateTime get lastUpdated =>
      RealmObjectBase.get<DateTime>(this, 'lastUpdated') as DateTime;
  @override
  set lastUpdated(DateTime value) =>
      RealmObjectBase.set(this, 'lastUpdated', value);

  @override
  bool get isFavourite =>
      RealmObjectBase.get<bool>(this, 'isFavourite') as bool;
  @override
  set isFavourite(bool value) =>
      RealmObjectBase.set(this, 'isFavourite', value);

  @override
  Stream<RealmObjectChanges<EventDetailsModel>> get changes =>
      RealmObjectBase.getChanges<EventDetailsModel>(this);

  @override
  EventDetailsModel freeze() =>
      RealmObjectBase.freezeObject<EventDetailsModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EventDetailsModel._);
    return const SchemaObject(
        ObjectType.realmObject, EventDetailsModel, 'EventDetailsModel', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('featureImage', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('lastUpdated', RealmPropertyType.timestamp),
      SchemaProperty('isFavourite', RealmPropertyType.bool),
    ]);
  }
}

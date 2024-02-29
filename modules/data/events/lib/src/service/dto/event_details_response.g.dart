// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_response.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class EventDetailsResponse extends _EventDetailsResponse
    with RealmEntity, RealmObjectBase, RealmObject {
  EventDetailsResponse(
    int id,
    String name,
    String description,
    String featureImage,
    String location,
    String lastUpdated,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'featureImage', featureImage);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'lastUpdated', lastUpdated);
  }

  EventDetailsResponse._();

  @override
  int get id => RealmObjectBase.get<int>(this, '_id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, '_id', value);

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
  String get lastUpdated =>
      RealmObjectBase.get<String>(this, 'lastUpdated') as String;
  @override
  set lastUpdated(String value) =>
      RealmObjectBase.set(this, 'lastUpdated', value);

  @override
  Stream<RealmObjectChanges<EventDetailsResponse>> get changes =>
      RealmObjectBase.getChanges<EventDetailsResponse>(this);

  @override
  EventDetailsResponse freeze() =>
      RealmObjectBase.freezeObject<EventDetailsResponse>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(EventDetailsResponse._);
    return const SchemaObject(
        ObjectType.realmObject, EventDetailsResponse, 'EventDetailsResponse', [
      SchemaProperty('id', RealmPropertyType.int,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('featureImage', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('lastUpdated', RealmPropertyType.string),
    ]);
  }
}

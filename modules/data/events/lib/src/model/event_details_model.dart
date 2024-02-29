import 'package:realm/realm.dart';

part 'event_details_model.g.dart';

@RealmModel()
class _EventDetailsModel {
  @PrimaryKey()
  late final int id;

  late String name;
  late String description;
  late String featureImage;
  late String location;
  late DateTime lastUpdated;
  late bool isFavourite = false;
}

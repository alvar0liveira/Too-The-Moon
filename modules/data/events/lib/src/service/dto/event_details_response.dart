import 'package:realm/realm.dart';

part 'event_details_response.g.dart';

@RealmModel()
class _EventDetailsResponse {
  @PrimaryKey()
  @MapTo('_id')
  late int id;
  late String name;
  late String description;
  late String featureImage;
  late String location;
  late String lastUpdated;
}

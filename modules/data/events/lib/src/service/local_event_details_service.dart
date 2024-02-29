import 'package:realm/realm.dart';

import '../model/event_details_model.dart';
import 'dto/event_details_response.dart';
import 'dto/extension_event_details_response.dart';
import 'package:logging/logging.dart';

class LocalEventDetailsService {
  late Realm _realm;

  final Logger _logger = Logger('LocalEventDetailsServiceLogger');

  LocalEventDetailsService() {
    LocalConfiguration config =
        Configuration.local([EventDetailsResponse.schema]);
    _realm = Realm(config);
  }

  Future<EventDetailsModel> addEventDetails(
      int id,
      String name,
      String description,
      String featureImage,
      String location,
      String lastUpdated,
      isFavourite) async {
    EventDetailsResponse eventDetailsResponse = EventDetailsResponse(
        id, name, description, featureImage, location, lastUpdated);

    late EventDetailsModel writtenResult;

    try {
      Future<EventDetailsResponse> result = _realm
          .writeAsync(() => _realm.add(eventDetailsResponse, update: true));

      writtenResult = (await result).toModel()..isFavourite = true;
    } catch (e) {
      _logger.warning('Failed to add event_details to database');
    }

    return writtenResult;
  }

  void removeEventDetails(int id) {
    try {
      EventDetailsResponse? eventDetailsResponse = _realm.find(id);

      if (eventDetailsResponse != null) {
        _realm.writeAsync(
            () => _realm.delete<EventDetailsResponse>(eventDetailsResponse));
      }
    } catch (e) {
      _logger.info('No EventDetails found with $id');
    }
  }

  Future<List<EventDetailsModel>> getEventDetails() {
    var eventsDetailsModel = _realm
        .all<EventDetailsResponse>()
        .toList()
        .map((e) => e.toModel(isFavourite: true));

    _logger.info('Found ${eventsDetailsModel.length} EventDetails');
    return Future<List<EventDetailsModel>>.value(eventsDetailsModel.toList());
  }

  Future<bool> isEventDetailsFavourite(int id) {
    EventDetailsResponse? eventDetailsResponse =
        _realm.find<EventDetailsResponse>(id);

    if (eventDetailsResponse != null) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}

import '../model/event_details_model.dart';
import '../service/dto/extension_event_details_response.dart';
import '../service/dto/event_details_response.dart';
import '../service/local_event_details_service.dart';
import '../service/remote_event_details_service.dart';

class EventDetailsModelRepository {
  final RemoteEventDetailsModelService _remoteEventDetailsModelService =
      RemoteEventDetailsModelService();
  final LocalEventDetailsService _localEventDetailsService =
      LocalEventDetailsService();

  Future<EventDetailsModel> getDetails(int id) async {
    EventDetailsResponse? response =
        await _remoteEventDetailsModelService.getDetails(id);

    EventDetailsModel eventDetailsModel = response?.toModel() ??
        EventDetailsModel(0, "", "", "", "", DateTime.now());

    return Future<EventDetailsModel>.value(eventDetailsModel);
  }

  Future<EventDetailsModel> addEventDetails(
      int id,
      String name,
      String description,
      String featureImage,
      String location,
      DateTime lastUpdated,
      isFavourite) {
    return _localEventDetailsService.addEventDetails(id, name, description,
        featureImage, location, lastUpdated.toIso8601String(), isFavourite);
  }

  Future<List<EventDetailsModel>> getFavouriteEventsDetails() {
    return _localEventDetailsService.getEventDetails();
  }

  void removeEventDetails(int id) {
    _localEventDetailsService.removeEventDetails(id);
  }

  Future<bool> isEventDetailsFavourite(int id) {
    return _localEventDetailsService.isEventDetailsFavourite(id);
  }
}

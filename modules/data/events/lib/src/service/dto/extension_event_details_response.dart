import '../../model/event_details_model.dart';
import 'event_details_response.dart';

extension FromEventDetailsResponseToModel on EventDetailsResponse {
  EventDetailsModel toModel({bool isFavourite = false}) {
    return EventDetailsModel(id, name, description, featureImage, location,
        DateTime.parse(lastUpdated),
        isFavourite: isFavourite);
  }
}

extension FromJson on Map<String, dynamic> {
  EventDetailsResponse eventDetailsResponseFromJson() {
    return EventDetailsResponse(
        this['id'] as int,
        this['name'] as String,
        this['description'] as String,
        this['feature_image'] as String,
        this['location'] as String,
        this['last_updated'] as String);
  }
}

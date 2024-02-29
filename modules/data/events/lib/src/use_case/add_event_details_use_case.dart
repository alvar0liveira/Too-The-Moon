
import 'package:events/src/model/event_details_model.dart';
import 'package:events/src/repository/event_details_repository.dart';

class AddEventDetailsUseCase {
  final EventDetailsModelRepository _detailsModelRepository =
      EventDetailsModelRepository();

  Future<EventDetailsModel> add(int id, String name, String description,
      String featureImage, String location, DateTime lastUpdated, isFavourite) {
    return _detailsModelRepository.addEventDetails(id, name, description,
        featureImage, location, lastUpdated, isFavourite);
  }
}

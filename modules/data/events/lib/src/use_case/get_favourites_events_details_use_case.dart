import 'package:events/src/model/event_details_model.dart';
import 'package:events/src/repository/event_details_repository.dart';

class GetFavouritesEventsDetailsUseCase {
  final EventDetailsModelRepository _detailsModelRepository =
      EventDetailsModelRepository();

  Future<List<EventDetailsModel>> get() {
    return _detailsModelRepository.getFavouriteEventsDetails();
  }
}

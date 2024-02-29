
import 'package:events/src/repository/event_details_repository.dart';

class CheckEventDetailsFavouriteUseCase {
  final EventDetailsModelRepository _eventDetailsModelRepository =
      EventDetailsModelRepository();

  Future<bool> isFavourite(int id) {
    return _eventDetailsModelRepository.isEventDetailsFavourite(id);
  }
}

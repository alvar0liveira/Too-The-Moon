import 'package:events/src/repository/event_details_repository.dart';

class RemoveEventDetailsUseCase {
  final EventDetailsModelRepository _detailsModelRepository =
      EventDetailsModelRepository();

  void remove(int id) {
    _detailsModelRepository.removeEventDetails(id);
  }
}

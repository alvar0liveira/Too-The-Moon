
import 'package:events/src/model/event_details_model.dart';
import 'package:events/src/repository/event_details_repository.dart';

class GetEventDetailsModelUseCase {
  final EventDetailsModelRepository _repo = EventDetailsModelRepository();

  Future<EventDetailsModel> get(int id) async {
    return await _repo.getDetails(id);
  }
}

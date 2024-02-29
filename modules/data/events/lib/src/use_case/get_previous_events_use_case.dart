
import 'package:events/src/model/event_model.dart';
import 'package:events/src/repository/event_repository.dart';

class GetPreviousEventsUseCase {
  final EventRepository repo = EventRepository();

  Future<List<EventModel>> get() async {
    return await repo.getPreviousEvents();
  }
}

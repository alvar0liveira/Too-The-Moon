import 'package:events/events.dart';
import 'package:shared/shared.dart';

import 'list_event_enum.dart';

class ListEventState {
  ListEventStatus status;
  List<EventModel>? events;
  ErrorModel? errorModel;

  ListEventState(this.status, this.events, this.errorModel);
}

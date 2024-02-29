
import 'package:events/events.dart';
import 'package:shared/shared.dart';

import 'event_details_status.dart';

class EventDetailsState {
  EventDetailsStatus status;
  EventDetailsModel? eventDetailsModel;
  ErrorModel? errorModel;

  EventDetailsState(this.status, this.eventDetailsModel, this.errorModel);
}

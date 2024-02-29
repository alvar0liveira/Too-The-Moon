import 'package:events/events.dart';
import 'package:shared/shared.dart';

class ListFavouriteState {
  List<EventDetailsModel>? favouriteEventsDetails;
  ErrorModel? errorModel;

  ListFavouriteState(this.favouriteEventsDetails, this.errorModel);
}

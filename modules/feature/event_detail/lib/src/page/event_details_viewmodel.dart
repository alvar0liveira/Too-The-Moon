import 'package:events/events.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../state/event_details_state.dart';
import '../state/event_details_status.dart';

class EventDetailsModelViewModel with ChangeNotifier {
  final GetEventDetailsModelUseCase _getEventDetailsModelUseCase =
      GetEventDetailsModelUseCase();
  final AddEventDetailsUseCase _addEventDetailsUseCase =
      AddEventDetailsUseCase();
  final RemoveEventDetailsUseCase _removeEventDetailsUseCase =
      RemoveEventDetailsUseCase();

  final CheckEventDetailsFavouriteUseCase _checkEventDetailsFavouriteUseCase =
      CheckEventDetailsFavouriteUseCase();

  EventDetailsState state =
      EventDetailsState(EventDetailsStatus.loading, null, null);

  Future<void> getEventsDetails(int id) async {
    try {
      EventDetailsModel eventDetailsModel =
          await _getEventDetailsModelUseCase.get(id);

      eventDetailsModel.isFavourite =
          await _checkEventDetailsFavouriteUseCase.isFavourite(id);

      state =
          EventDetailsState(EventDetailsStatus.data, eventDetailsModel, null);
    } catch (e) {
      print(e);
      EventDetailsState(EventDetailsStatus.error, null, e.toModel());
    }
    notifyListeners();
  }

  void setIsFavourite() {
    if (state.eventDetailsModel?.isFavourite == true) {
      _removeEventDetailsUseCase.remove(state.eventDetailsModel?.id ?? -1);
      state.eventDetailsModel?.isFavourite = false;
    } else {
      _addEventDetailsUseCase.add(
          state.eventDetailsModel?.id ?? -1,
          state.eventDetailsModel?.name ?? "",
          state.eventDetailsModel?.description ?? "",
          state.eventDetailsModel?.featureImage ?? "",
          state.eventDetailsModel?.location ?? "",
          state.eventDetailsModel?.lastUpdated ?? DateTime.now(),
          true);
      state.eventDetailsModel?.isFavourite = true;
    }

    state = EventDetailsState(
        EventDetailsStatus.data, state.eventDetailsModel, null);

    notifyListeners();
  }
}

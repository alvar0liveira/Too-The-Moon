import 'package:events/events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../state/list_event_enum.dart';
import '../state/list_event_state.dart';

class ListEventViewModel with ChangeNotifier {
  GetPreviousEventsUseCase previousUseCase = GetPreviousEventsUseCase();
  GetUpComingEventsUseCase upComingEventsUseCase = GetUpComingEventsUseCase();

  List<EventModel> previousEvents = List.empty(growable: true);
  List<EventModel> upComingEvents = List.empty(growable: true);
  bool isPrevious = true;

  ListEventState state = ListEventState(ListEventStatus.loading, null, null);

  ListEventViewModel() {
    getPreviousEvents();
    getUpComingEvents();
  }

  void getPreviousEvents() async {
    try {
      List<EventModel> events = await previousUseCase.get();
      previousEvents.addAll(events);
      state = ListEventState(ListEventStatus.data, previousEvents, null);
    } catch (e) {
      print(e);
      state = ListEventState(ListEventStatus.error, null, e.toModel());
    }
    notifyListeners();
  }

  void getUpComingEvents() async {
    try {
      List<EventModel> events = await upComingEventsUseCase.get();
      upComingEvents.addAll(events);
      state = ListEventState(ListEventStatus.data, upComingEvents, null);
    } catch (e) {
      print(e);
      state = ListEventState(ListEventStatus.error, null, e.toModel());
    }
    notifyListeners();
  }
}

import 'dart:async';

import 'extension_event_response.dart';
import '../service/dto/event_response.dart';
import '../service/event_service.dart';

import '../model/event_model.dart';

class EventRepository {
  final EventService _eventService = EventService();
  String nextPrevious = "";
  String nextNext = "";

  Future<List<EventModel>> getPreviousEvents() async {
    EventResponse? response = await _eventService.getPreviousEvents(nextPrevious);
    nextPrevious = response?.next ?? "";
    List<EventModel> events = response?.toModel() ?? List.empty();
    return events;
  }

  Future<List<EventModel>> getUpComingEvents() async {
    EventResponse? response = await _eventService.getUpcomingEvents(nextPrevious);
    nextNext = response?.next ?? "";
    return response?.toModel() ?? List.empty();
  }
}

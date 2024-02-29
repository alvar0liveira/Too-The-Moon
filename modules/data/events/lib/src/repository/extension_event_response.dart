import 'dart:convert';

import '../service/dto/event.dart';
import '../service/dto/event_response.dart';
import '../model/event_model.dart';

extension ToModel on EventResponse {
  List<EventModel> toModel() {
    return results
        .map((e) => EventModel(e.id, e.name, e.description, e.featureImage))
        .toList();
  }
}

extension ToEventModel on List<Event> {
  List<EventModel> toModel() {
    return map((e) => EventModel(e.id, e.name, e.description, e.featureImage))
        .toList();
  }
}

extension ToEvents on List<EventModel> {
  List<Event> toEvents() {
    return map((e) => Event(e.id, e.name, e.description, e.featureImage))
        .toList();
  }
}

extension ListToJson on List<Event> {
  String toJson() {
    return jsonEncode(map((e) => e.toJson()).toList());
  }
}

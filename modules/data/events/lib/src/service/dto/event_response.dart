import 'event.dart';

class EventResponse {
  late int count;
  late String next;
  late Iterable<Event> results;

  EventResponse.fromJson(
    Map<String, dynamic> json
  ) { 
    count = json['count'] as int;
    next = json['next'] as String? ?? "";
    List<dynamic> list = json['results'] as List<dynamic>;
    results = list.map((e) => Event.fromJson(e));
  }
}
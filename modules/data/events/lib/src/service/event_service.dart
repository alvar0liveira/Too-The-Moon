import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:standalone/standalone.dart';

import 'dto/event_response.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future<EventResponse?> getNext(String fullUrl) async {
    Uri url = Uri.parse(fullUrl);
    http.Response response = await http.get(url);
    return EventResponse.fromJson(jsonDecode(response.body));
  }

  Future<EventResponse?> getPreviousEvents(String url) async {
    Uri finalUrl;
    if (url.isEmpty) {
      finalUrl = Uri.parse(_buildPathEventsList(false));
    } else {
      finalUrl = Uri.parse(url);
    }
    http.Response response = await http.get(finalUrl);
    return EventResponse.fromJson(jsonDecode(response.body));
  }

  Future<EventResponse?> getUpcomingEvents(String url) async {
    Uri finalUrl;
    if (url.isEmpty) {
      finalUrl = Uri.parse(_buildPathEventsList(true));
    } else {
      finalUrl = Uri.parse(url);
    }
    http.Response response = await http.get(finalUrl);
    return EventResponse.fromJson(jsonDecode(response.body));
  }

  String _buildPathEventsList(bool isUpcoming) {
    String middlePath = "";

    if (isUpcoming == true) {
      middlePath = "upcoming";
    } else {
      middlePath = "previous";
    }

    debugPrint(
        "$baseUrl$apiVersion$eventPath$middlePath/?format=json&limit=10&offset=0");

    return "$baseUrl$apiVersion$eventPath$middlePath/?format=json&limit=10&offset=0";
  }
}

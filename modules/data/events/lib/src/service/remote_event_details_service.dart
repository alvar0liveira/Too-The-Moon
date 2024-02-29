import 'dart:convert';

import 'package:standalone/standalone.dart';

import 'dto/event_details_response.dart';
import 'dto/extension_event_details_response.dart';
import 'package:http/http.dart' as http;

class RemoteEventDetailsModelService {
  Future<EventDetailsResponse?> getDetails(int id) async {
    Uri url = Uri.parse(_buildPathEventDetailsModel(id));
    http.Response response = await http.get(url);
    return (jsonDecode(response.body) as Map<String, dynamic>)
        .eventDetailsResponseFromJson();
  }

  String _buildPathEventDetailsModel(int id) {
    return "$baseUrl$apiVersion$eventPath$id?format=json";
  }
}

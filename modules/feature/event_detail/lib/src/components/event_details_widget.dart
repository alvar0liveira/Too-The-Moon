import 'package:events/events.dart';
import 'package:flutter/material.dart';

class EventDetailsWidget extends StatelessWidget {
  final EventDetailsModel eventDetailsModel;

  const EventDetailsWidget({super.key, required this.eventDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Name:", style: Theme.of(context).textTheme.titleLarge),
        Text(eventDetailsModel.name),
        Text("Description:", style: Theme.of(context).textTheme.titleSmall),
        Text(eventDetailsModel.description),
        Image.network(eventDetailsModel.featureImage),
        Text(
          "Location",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(eventDetailsModel.location,
            style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

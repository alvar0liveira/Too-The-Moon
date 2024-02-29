import 'package:events/events.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ListEventWidget extends StatelessWidget {
  final List<EventModel> events;
  final ScrollController scrollController;

  const ListEventWidget(
      {super.key, required this.events, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: events.length,
        itemBuilder: (context, index) {
          EventModel? item = events[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(eventDetailsPageRoute,
                  arguments: EventDetailsScreenArguments(item.id));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.network(item.featureImage),
                      Text(
                        "Name: ${item.name}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "Description: ${item.description}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

import 'package:events/events.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class FavouriteListWidget extends StatelessWidget {
  final List<EventDetailsModel> favourites;
  final Function(int id) onDismiss;
  final Function onNavigate;

  const FavouriteListWidget(
      {super.key,
      required this.favourites,
      required this.onDismiss,
      required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return Center(
        child: Text('No favourite events yet'),
      );
    }
    return ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          EventDetailsModel? item = favourites[index];

          return Dismissible(
            key: Key(item.id.toString()),
            onDismissed: (direction) => onDismiss(item.id),
            background: Container(
              color: Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.delete),
                  Text(
                    'Delete',
                  )
                ],
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(eventDetailsPageRoute,
                        arguments: EventDetailsScreenArguments(item.id))
                    .then((value) => onNavigate());
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(item.name),
              ),
            ),
          );
        });
  }
}

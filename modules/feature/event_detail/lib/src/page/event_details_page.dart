import 'package:event_detail/src/components/event_details_widget.dart';
import 'package:event_detail/src/components/favourite_app_bar.dart';
import 'package:event_detail/src/state/event_details_status.dart';
import 'package:events/events.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'event_details_viewmodel.dart';
import 'package:provider/provider.dart';

class EventDetailsModelPage extends StatefulWidget {
  const EventDetailsModelPage({super.key, required this.arguments});

  final EventDetailsScreenArguments arguments;

  @override
  State<EventDetailsModelPage> createState() => _EventDetailsModelPageState();
}

class _EventDetailsModelPageState extends State<EventDetailsModelPage>
    with SingleTickerProviderStateMixin {
  final EventDetailsModelViewModel _viewModel = EventDetailsModelViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.getEventsDetails(widget.arguments.id);
  }

  Widget _eventDetailsPage(
      EventDetailsStatus status, EventDetailsModel? eventDetailsModel) {
    switch (status) {
      case EventDetailsStatus.loading:
        return const CircularProgressIndicator();
      case EventDetailsStatus.data:
        return EventDetailsWidget(eventDetailsModel: eventDetailsModel!);
      case EventDetailsStatus.error:
        Navigator.pushNamed(context, errorPageRoute);
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EventDetailsModelViewModel>(
      create: ((context) => _viewModel),
      child: Consumer<EventDetailsModelViewModel>(
        builder: (context, value, child) {
          EventDetailsModel eventDetails = value.state.eventDetailsModel ??
              EventDetailsModel(0, "Loading", "", "", "", DateTime.now(),
                  isFavourite: false);

          return Scaffold(
              appBar: FavouriteAppBarWidget(
                  isFavourite: eventDetails.isFavourite,
                  name: eventDetails.name,
                  callback: () => value.setIsFavourite()),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: _eventDetailsPage(
                      value.state.status, value.state.eventDetailsModel),
                ),
              ));
        },
      ),
    );
  }
}

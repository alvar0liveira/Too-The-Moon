import 'package:flutter/material.dart';
import 'package:list_event/src/component/list_event_widget.dart';
import 'package:shared/shared.dart';
import 'list_event_viewmodel.dart';
import '../state/list_event_enum.dart';
import 'package:provider/provider.dart';

class ListEventPage extends StatefulWidget {
  const ListEventPage({super.key});

  @override
  State<StatefulWidget> createState() => _ListEventPageState();
}

class _ListEventPageState extends State<ListEventPage>
    with SingleTickerProviderStateMixin {
  ListEventViewModel viewModel = ListEventViewModel();
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          viewModel.isPrevious = true;
        } else {
          viewModel.isPrevious = false;
        }
      });
    });
    _scrollController.addListener(() {
      _loadMoreData();
    });
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        if (_tabController.index == 0) {
          viewModel.isPrevious = true;
          viewModel.getPreviousEvents();
        } else {
          viewModel.isPrevious = false;
          viewModel.getUpComingEvents();
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget eventPage(BuildContext context, ListEventViewModel value) {
    ListEventStatus status = value.state.status;
    switch (status) {
      case ListEventStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ListEventStatus.data:
        if (value.isPrevious) {
          return ListEventWidget(
            events: value.previousEvents,
            scrollController: _scrollController,
          );
        } else {
          return ListEventWidget(
            events: value.upComingEvents,
            scrollController: _scrollController,
          );
        }
      case ListEventStatus.error:
        Navigator.pushNamed(context, errorPageRoute);
        return Container();
      default:
        return Container();
    }
  }

  Widget homePage(BuildContext context) {
    return ChangeNotifierProvider<ListEventViewModel>(
        create: ((context) => viewModel),
        child: Consumer<ListEventViewModel>(builder: (context, value, child) {
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(controller: _tabController, tabs: const [
                  Center(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.skip_previous),
                        Text("Previous")
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[Icon(Icons.skip_next), Text("Next")],
                    ),
                  )
                ]),
                Expanded(
                  child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        eventPage(context, value),
                        eventPage(context, value)
                      ]),
                ),
              ],
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return homePage(context);
  }
}

import 'package:flutter/material.dart';
import 'package:list_favourite/src/component/list_favourite_widget.dart';
import 'list_favourite_viewmodel.dart';
import 'package:provider/provider.dart';

class ListFavouritePage extends StatefulWidget {
  const ListFavouritePage({super.key});

  @override
  State<ListFavouritePage> createState() => _ListFavouritePageState();
}

class _ListFavouritePageState extends State<ListFavouritePage>
    with SingleTickerProviderStateMixin {
  final ListFavouriteViewModel _viewModel = ListFavouriteViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListFavouriteViewModel>(
      create: ((context) => _viewModel),
      child: Consumer<ListFavouriteViewModel>(
        builder: (context, value, child) {
          if (value.state.favouriteEventsDetails != null &&
              value.state.errorModel == null) {
            return FavouriteListWidget(
              favourites: value.state.favouriteEventsDetails!,
              onDismiss: (id) => value.unsetFavourite(id),
              onNavigate: () => setState(() {
                value.getFavourites();
              }),
            );
          } else if (value.state.favouriteEventsDetails == null &&
              value.state.errorModel != null) {
            // Navigator.pushNamed(context, '/error');
            return Container();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

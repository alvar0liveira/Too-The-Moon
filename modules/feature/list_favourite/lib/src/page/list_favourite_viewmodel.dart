import 'package:events/events.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import '../state/list_favourite_state.dart';

class ListFavouriteViewModel with ChangeNotifier {
  final GetFavouritesEventsDetailsUseCase _getFavouritesEventsDetailsUseCase =
      GetFavouritesEventsDetailsUseCase();

  final RemoveEventDetailsUseCase _removeEventDetailsUseCase =
      RemoveEventDetailsUseCase();

  ListFavouriteState state = ListFavouriteState(null, null);

  ListFavouriteViewModel() {
    getFavourites();
  }

  void getFavourites() async {
    try {
      List<EventDetailsModel> favourites =
          await _getFavouritesEventsDetailsUseCase.get();
      state = ListFavouriteState(favourites, null);
    } catch (e) {
      state = ListFavouriteState(null, e.toModel());
    }
    notifyListeners();
  }

  void unsetFavourite(int id) {
    _removeEventDetailsUseCase.remove(id);
  }
}

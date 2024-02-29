import 'package:flutter/material.dart';

class FavouriteAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isFavourite;
  final String name;
  final VoidCallback callback;

  const FavouriteAppBarWidget(
      {super.key,
      required this.isFavourite,
      required this.name,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (isFavourite) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return AppBar(
      title: Text(name),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(onTap: callback, child: Icon(icon)),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

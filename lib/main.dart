import 'package:event_detail/event_detail.dart';
import 'package:flutter/material.dart';
import 'package:list_event/list_event.dart';
import 'package:list_favourite/list_favourite.dart';
import 'package:shared/shared.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Logger.root.level = Level.ALL;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ListEventViewModel()),
        ChangeNotifierProvider.value(value: EventDetailsModelViewModel()),
        ChangeNotifierProvider.value(value: ListFavouriteViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To the Moon',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
          primarySwatch: Colors.purple,
          hintColor: Colors.deepOrange,
        ),
        initialRoute: mainPageRoute,
        routes: {
          mainPageRoute: (context) => const BottomNav(),
          errorPageRoute: (context) {
            // Add Arguements
            return ErrorPage();
          },
          eventDetailsPageRoute: (context) {
            return EventDetailsModelPage(
              arguments: ModalRoute.of(context)?.settings.arguments
                  as EventDetailsScreenArguments,
            );
          }
        },
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  
  static const List<Widget> _widgetOptions = <Widget>[
    ListEventPage(),
    ListFavouritePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To the Moon')),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favourites')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

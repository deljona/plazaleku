import 'package:flutter/material.dart';
import 'package:plazaleku/screens/tabs/Lista.dart';
import 'package:plazaleku/screens/tabs/Mapa.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Indice actual de la página
  int selectedIndex = 1;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static const List<Widget> pages = <Widget>[
    Icon(
      Icons.favorite_rounded,
      size: 150,
    ),
    CallsPage(),
    Icon(
      Icons.settings_rounded,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2E4E5D),
          elevation: 0,
          title: Center(
              child: Image.asset(
            "assets/images/logo.png",
            scale: 3,
          )),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          elevation: 0,
          destinations: const <NavigationDestination>[
            NavigationDestination(
                icon: Icon(Icons.favorite_rounded), label: 'Guardados'),
            NavigationDestination(
                icon: Icon(Icons.local_parking_rounded), label: 'Parkings'),
            NavigationDestination(
                icon: Icon(Icons.settings_rounded), label: 'Ajustes'),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: onItemTapped,
        ),
      ),
    );
  }
}

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2E4E5D),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(text: 'Lista'),
                  Tab(
                    text: 'Mapa',
                  ),
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Lista(),
            Mapa(),
          ],
        ),
      ),
    );
  }
}

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
          elevation: 0,
          title: const Text('Plazaleku'),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          iconSize: 32,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded), label: 'Guardados'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_parking_rounded), label: 'Parkings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Ajustes'),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
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

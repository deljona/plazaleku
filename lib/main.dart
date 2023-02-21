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
        // ENCABEZADO
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff2E4E5D),
          //elevation: 0,
          title: Center(
              child: Image.asset(
            "assets/images/logo.png",
            scale: 4,
          )),
        ),
        // CUERPO
        body: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
        // BOTONES DE NAVEGACIÓN
        bottomNavigationBar: NavigationBar(
          backgroundColor: const Color(0xff2E4E5D),
          elevation: 0,
          destinations: const <NavigationDestination>[
            NavigationDestination(
                icon: Icon(
                  Icons.favorite_outline_rounded,
                  color: Color(0xffF4ACB7),
                ),
                selectedIcon: Icon(
                  Icons.favorite_rounded,
                  color: Color(0xffF4ACB7),
                ),
                label: 'Guardados'),
            NavigationDestination(
                icon: Icon(Icons.eco_outlined, color: Color(0xff63ED84)),
                selectedIcon: Icon(Icons.eco_rounded, color: Color(0xff63ED84)),
                label: 'Parkings'),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined, color: Color(0xffDAE2DF)),
                selectedIcon:
                    Icon(Icons.settings_rounded, color: Color(0xffDAE2DF)),
                label: 'Ajustes'),
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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75.0),
            child: AppBar(
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Lista',
                    icon: Icon(Icons.filter_list_sharp),
                  ),
                  Tab(
                    text: 'Mapa',
                    icon: Icon(Icons.map_sharp),
                  ),
                ],
              ),
              backgroundColor: const Color(0xff2E4E5D),
            )),
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

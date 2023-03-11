import 'package:flutter/material.dart';
import 'package:plazaleku/screens/notas.dart';
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

  // Lista de páginas
  static const List<Widget> pages = <Widget>[
    NotasPage(),
    CallsPage(),
    Center(
      child: Icon(
        Icons.settings_rounded,
        size: 150,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.dark(
              primary: Colors.white,
              background: Color(0xff2E4E5D),
              secondary: Color.fromARGB(169, 102, 147, 168)),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ENCABEZADO
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xff2E4E5D),
          elevation: 0,
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
                label: 'Mis notas'),
            NavigationDestination(
                icon: Icon(Icons.explore_outlined, color: Color(0xff63ED84)),
                selectedIcon: Icon(Icons.explore, color: Color(0xff63ED84)),
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

// PARA CREAR LA NAVEGACIÓN ENTRE LAS TABS
class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage>
    with AutomaticKeepAliveClientMixin<CallsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              bottom: const TabBar(
                indicatorColor: Color(0xffCFFFB0),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                tabs: <Widget>[
                  Tab(
                    text: 'Lista',
                    icon: Icon(
                      Icons.filter_list_sharp,
                      color: Colors.white,
                    ),
                  ),
                  Tab(
                    text: 'Mapa',
                    icon: Icon(
                      Icons.map_sharp,
                      color: Colors.white,
                    ),
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

  @override
  bool get wantKeepAlive => true;
}

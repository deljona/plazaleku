import 'package:flutter/material.dart';
import 'package:plazaleku/connection/net_service.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  late Future<List<dynamic>> futureParking;

  @override
  void initState() {
    super.initState();
    futureParking = fetchParking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureParking,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return Card(
                  color: const Color(0xff2E4E5D),
                  child:
                      ListTile(title: Text("${item['properties']['nombre']}")),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff63ED84),
            ),
          );
        },
      ),
    );
  }
}

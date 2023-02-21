import 'package:flutter/material.dart';
import 'package:plazaleku/models/Parking.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Conexion.obtenerXML(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return Card(
                  child: ListTile(
                    // NOMBRE PARKING
                    title: Text(item['properties']['nombre']),
                    onTap: () {},
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

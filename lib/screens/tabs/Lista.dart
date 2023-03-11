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
  initState() {
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
                    shape: const RoundedRectangleBorder(),
                    color: const Color(0xff2E4E5D),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          // NOMBRE DEL PARKING
                          Row(
                            children: [
                              Text(
                                "${item['properties']['nombre']}".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              /*
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Color(0xffF4ACB7),
                                  size: 26,
                                ),
                              )
                              */
                            ],
                          ),
                          // PLAZAS PÚBLICAS DISPONIBLES
                          Row(
                            children: [
                              const Icon(
                                Icons.local_parking_sharp,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${item['properties']['plazasRotatorias']} / ",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                (item['properties']['libres'] == "0")
                                    ? "${item['properties']['libres']}"
                                    : "${item['properties']['libres']}",
                                style: (item['properties']['libres'] == "0")
                                    ? const TextStyle(
                                        color: Color.fromARGB(255, 184, 97, 91),
                                        fontSize: 16)
                                    : const TextStyle(
                                        color: Color(0xffCFFFB0), fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              const Text('Públicas libres')
                            ],
                          ),
                          const SizedBox(height: 1),
                          // PLAZAS RESIDENTES
                          Row(
                            children: [
                              const Icon(
                                Icons.emoji_transportation_sharp,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                (item['properties']['libres'] == 0)
                                    ? "${item['properties']['plazasResidentesLibres']}"
                                    : "${item['properties']['plazasResidentesLibres']}",
                                style: (item['properties']
                                            ['plazasResidentesLibres'] ==
                                        0)
                                    ? const TextStyle(
                                        color: Color.fromARGB(255, 184, 97, 91),
                                        fontSize: 16)
                                    : const TextStyle(
                                        color: Color(0xffCFFFB0), fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              const Text('Residentes libres')
                            ],
                          ),
                          const SizedBox(height: 22),
                          // BOTONES Y PRECIO
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.eco_rounded,
                                  color: Color(0xff63ED84),
                                ),
                                label: const Text(
                                  'Cómo llegar',
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                              ),
                              const Spacer(),
                              // BOTÓN INFORMATIVO SOBRE LOS PRECIOS
                              IconButton(
                                onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              detallePrecios(item)
                                            ],
                                          ),
                                        ))),
                                icon: const Icon(Icons.info_outline),
                                iconSize: 20,
                              ),
                              Text(
                                (item['properties']['precios'][4] == "")
                                    ? 'N/A'
                                    : '${item['properties']['precios'][4]} €',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(width: 5),
                              const Text("/ 2h")
                            ],
                          )
                        ],
                      ),
                    ));
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

  DataTable detallePrecios(item) {
    return DataTable(columns: const [
      DataColumn(label: Text('Tiempo')),
      DataColumn(label: Text('Precio'))
    ], rows: [
      DataRow(cells: [
        const DataCell(Text("15'")),
        DataCell(Text("${item['properties']['precios'][0]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("30'")),
        DataCell(Text("${item['properties']['precios'][1]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("1h")),
        DataCell(Text("${item['properties']['precios'][2]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("1h 30'")),
        DataCell(Text("${item['properties']['precios'][3]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("2h")),
        DataCell(Text("${item['properties']['precios'][4]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("3h")),
        DataCell(Text("${item['properties']['precios'][5]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("5h")),
        DataCell(Text("${item['properties']['precios'][6]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("9h")),
        DataCell(Text("${item['properties']['precios'][7]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("12h")),
        DataCell(Text("${item['properties']['precios'][8]} €")),
      ]),
      DataRow(cells: [
        const DataCell(Text("+ 14h")),
        DataCell(Text("${item['properties']['precios'][9]} €")),
      ]),
    ]);
  }
}

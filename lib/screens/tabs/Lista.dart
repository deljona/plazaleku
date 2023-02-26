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
                          Row(
                            children: [
                              Text(
                                "${item['properties']['nombre']}".toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Color(0xffF4ACB7),
                                  size: 26,
                                ),
                              )
                            ],
                          ),
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
                                        color: Color.fromARGB(255, 184, 97, 91))
                                    : const TextStyle(color: Color(0xffCFFFB0)),
                              )
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
}

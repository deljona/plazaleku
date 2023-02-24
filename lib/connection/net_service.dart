import 'dart:convert';
import 'package:plazaleku/models/Parking.dart';

import 'package:http/http.dart' as http;

Future<Parking> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://www.donostia.eus/info/ciudadano/camaras_trafico.nsf/getParkings.xsp'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Parking.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('No se pudieron cargar los datos.');
  }
}

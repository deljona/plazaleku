import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchParking() async {
  final response = await http.get(Uri.parse(
      'https://www.donostia.eus/info/ciudadano/camaras_trafico.nsf/getParkings.xsp'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body)['features'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('No se pudieron cargar los datos.');
  }
}

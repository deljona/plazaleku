import 'dart:convert';

import 'package:http/http.dart' as http;

class Conexion {
  static Future<List<String>> obtenerXML() async {
    Uri url = Uri.parse(
        "https://www.donostia.eus/info/ciudadano/camaras_trafico.nsf/getParkings.xsp");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error al cargar el XML');
    }
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class Conexion {
  static Future<List<dynamic>> obtenerXML() async {
    Uri url = Uri.parse(
        "https://www.donostia.eus/info/ciudadano/camaras_trafico.nsf/getParkings.xsp");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['features'];
    } else {
      throw Exception('Error al cargar el XML');
    }
  }
}

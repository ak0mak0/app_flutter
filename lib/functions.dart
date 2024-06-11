import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static const String baseURL = 'http:localhostlalalalala';

  static Future<Map<String, dynamic>> fetchSitio(String id) async {
    final response = await http.post(
      Uri.parse('$baseURL/getsitio'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'_id': id}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // FUNCION PARA OBTENER SITIOS
  static Future<List<dynamic>> fetchSitios() async {
    final response = await http.post(Uri.parse('$baseURL/sitios'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['sitios'];
    } else {
      throw Exception('Failed to load sitios');
    }
  }

  // FUNCION PARA INICIAR SESION
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  // FUNCION PARA INICIAR SESION
  static Future<Map<String, dynamic>> register(String username, String name, String password) async {
    final response = await http.post(
      Uri.parse('$baseURL/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'name': name,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }
}
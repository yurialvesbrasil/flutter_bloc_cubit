import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "https://6336f0395327df4c43cc969a.mockapi.io";

  Future<List<dynamic>> fetchTodos() async {
    try {
      final response = await get(Uri.parse("$baseUrl/todos"));
      print("ok: ${response.body}");
      return jsonDecode(response.body) as List;
    } catch (e) {
      print("error: ${e}");
      throw Exception(e);
    }
  }
}

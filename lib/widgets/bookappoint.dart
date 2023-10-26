import 'package:http/http.dart' as http;
import 'dart:convert';

class BookAppoint {
  Future<List<dynamic>> fetchJours() async {
    final response = await http.get(Uri.parse('https://doctor-app-h45i.onrender.com/doctor/list_id_doctor/32/'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final jours = jsonData['jours'];
      return jours;
    } else {
      throw Exception('Failed to fetch jours');
    }
  }

  static void main() async {
    try {
      final bookAppoint = BookAppoint();
      final jours = await bookAppoint.fetchJours();
      print(jours);
    } catch (e) {
      print(e);
    }
  }
}

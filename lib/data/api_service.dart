import 'package:http/http.dart' as http;
import 'dart:convert';
import '../domain/data_model.dart';

class ApiService {
  final String _baseurl = "https://jsonplaceholder.typicode.com";
  Future<List<User>> fetchusers() async {
    final response = await http.get(Uri.parse('$_baseurl/users'));
    if (response.statusCode == 200) {
      List<dynamic> jsonlist = jsonDecode(response.body);
      return jsonlist.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

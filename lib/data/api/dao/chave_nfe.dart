import 'dart:convert';
import 'package:http/http.dart' as http;

class Danfe_Dao {
  final String apiUrl = 'http://54.90.98.255:6969/ChaveNF';

  Future<String> Call_Danfe_API(String chave) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode({'chavenf': chave}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load DANFE data');
    }
  }
}

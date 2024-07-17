import 'package:http/http.dart' as http;

class Login_Dao {
  final String apiUrl = 'http://54.90.98.255:6969/login';

  Future<int> Call_Login_API(String b64) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': b64
      },
    );

    return response.statusCode;
  }
}

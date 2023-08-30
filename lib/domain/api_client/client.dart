import 'package:http/http.dart' as http;

class MyClient {
  var url = 'http://domain/';
  Future<http.Response> get({required String pathName}) async {
    final response = await http.get(Uri.parse(url + '$pathName'));
    return response;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AuthProvider {
  Future<bool> getCodeByPhoneNumber({required String numberPhone});
  Future<String> getCodeByPhoneNumberTest({required String numberPhone});
  Future<({String accessToken, String refresToken})> makeToken(
      {required String numberPhone, required String code});
  Future<({String accessToken, String refresToken})> makeNewJwtTokens(
      {required String refreshToken});
}

class AuthProviderImpl implements AuthProvider {
  const AuthProviderImpl();
  @override
  Future<bool> getCodeByPhoneNumber({required String numberPhone}) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://10.3.29.20:9115/auth/'));
    request.body = json.encode({
      "phone": numberPhone,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Ошибка получения кода');
    }
  }

  @override
  Future<String> getCodeByPhoneNumberTest({required String numberPhone}) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('http://10.3.29.20:9115/auth/'));
    request.body = json.encode({
      "phone": numberPhone,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final String result = jsonData['code'];
      return result;
    } else {
      throw Exception('Ошибка получения кода');
    }
  }

  @override
  Future<({String accessToken, String refresToken})> makeToken(
      {required String numberPhone, required String code}) async {
    var headers = {'accept': 'application/json'};

    var request = http.Request(
        'POST',
        Uri.parse(
            'http://10.3.29.20:9115/auth/verify_sms?phone=$numberPhone&code=$code'));

    request.body = json.encode({
      "phone": numberPhone,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final String accessToken = jsonData['access_token'];
      final String refresToken = jsonData['refresh_token'];

      return (accessToken: accessToken, refresToken: refresToken);
    } else {
      throw Exception('Error fetching makeToken');
    }
  }

  @override
  Future<({String accessToken, String refresToken})> makeNewJwtTokens(
      {required String refreshToken}) async {
    var headers = {'accept': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'http://10.3.29.20:9115/auth/switch_token?token=$refreshToken'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final String accessToken = jsonData['access_token'];
      final String refresToken = jsonData['refresh_token'];
      return (accessToken: accessToken, refresToken: refresToken);
    } else {
      throw Exception('Error fetching makeNewJwtToken');
    }
  }
}

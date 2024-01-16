import 'dart:convert';

import 'package:hr_app_flutter/core/constant/constants.dart';
import 'package:http/http.dart' as http;

import '../../../../core/components/rest_clients/api_client.dart';

abstract interface class IAuthProvider {
  Future<bool> getCodeByPhoneNumber({required String numberPhone});

  Future<({String accessToken, String refresToken})> makeToken(
      {required String numberPhone, required String code});
  Future<({String accessToken, String refresToken})> makeNewJwtTokens(
      {required String refreshToken});
}

class AuthProviderImpl implements IAuthProvider {
  final IHTTPService _httpService;
  const AuthProviderImpl(this._httpService);
  @override
  Future<bool> getCodeByPhoneNumber({required String numberPhone}) async {
    String uri = '$urlAdress/auth/';

    final body = json.encode({
      "phone": numberPhone,
    });

    final response =
        await _httpService.post(uri: uri, userToken: null, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Ошибка получения кода');
    }
  }

  @override
  Future<({String accessToken, String refresToken})> makeToken(
      {required String numberPhone, required String code}) async {
    String uri = '$urlAdress/auth/verify_sms?phone=$numberPhone&code=$code';

    final body = json.encode({
      "phone": numberPhone,
    });

    final response =
        await _httpService.post(uri: uri, userToken: null, body: body);

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
        'POST', Uri.parse('$urlAdress/auth/switch_token?token=$refreshToken'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsonResponse = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonResponse);
      final String accessToken = jsonData['access_token'];
      final String refresToken = jsonData['refresh_token'];
      return (accessToken: accessToken, refresToken: refresToken);
    } else {
      throw Exception('Error fetching make New Jwt Token');
    }
  }
}

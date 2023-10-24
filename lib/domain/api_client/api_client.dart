import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io' as io;

abstract interface class IHTTPService {
  Future<StreamedResponse> get(
      {required String uri, required String userToken});
  Future<StreamedResponse> post({
    required String uri,
    required String? body,
    required String? userToken,
  });
  Future<StreamedResponse> postWithFile({
    required String uri,
    required String userToken,
    required io.File imageFile,
    Map<String, String>? fields,
  });
}

class HTTPServiceImpl implements IHTTPService {
  const HTTPServiceImpl();

  @override
  Future<StreamedResponse> get(
      {required String uri, required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
    var request = Request('GET', Uri.parse(uri));

    request.headers.addAll(headers);

    StreamedResponse response =
        await request.send().timeout(const Duration(seconds: 8));
    return response;
  }

  @override
  Future<StreamedResponse> post(
      {required String uri,
      required String? body,
      required String? userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    if (userToken != null) {
      headers.addAll({'Authorization': 'Bearer $userToken'});
    }

    var request = Request('POST', Uri.parse(uri));
    if (body != null) request.body = body;

    request.headers.addAll(headers);

    StreamedResponse response =
        await request.send().timeout(const Duration(seconds: 8));
    return response;
  }

  @override
  Future<StreamedResponse> postWithFile({
    required String uri,
    required String userToken,
    required io.File imageFile,
    Map<String, String>? fields,
  }) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken',
    };

    var request = MultipartRequest('POST', Uri.parse(uri));
    if (fields != null) {
      request.fields.addAll({...fields});
    }

    var multipartFile = await MultipartFile.fromPath(
      'file',
      imageFile.path,
      filename: imageFile.path.split('/').last,
      contentType: MediaType('image', 'jpg'),
    );
    request.files.add(multipartFile);
    request.headers.addAll(headers);

    StreamedResponse response =
        await request.send().timeout(const Duration(seconds: 8));
    return response;
  }
}

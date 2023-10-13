import 'package:http/http.dart';

abstract interface class IHTTPService {
  Future<StreamedResponse> get(
      {required String uri, required String userToken});
  Future<StreamedResponse> post(
      {required String uri, required String? body, required String userToken});
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
      required String userToken}) async {
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $userToken',
      'Content-Type': 'application/json'
    };

    var request = Request('POST', Uri.parse(uri));
    if (body != null) request.body = body;

    request.headers.addAll(headers);

    StreamedResponse response =
        await request.send().timeout(const Duration(seconds: 8));
    return response;
  }
}

enum ApiClientExceptionType { network, auth, other, notFound }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

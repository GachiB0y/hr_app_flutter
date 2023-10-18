enum ApiClientExceptionType { network, auth, other, notFound, addTags }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

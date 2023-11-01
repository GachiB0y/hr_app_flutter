enum ApiClientExceptionType {
  network,
  auth,
  other,
  notFound,
  addTags,
  openFileImage,
  openFileDocuments,
}

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

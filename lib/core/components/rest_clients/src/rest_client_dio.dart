import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hr_app_flutter/core/components/rest_clients/rest_client.dart';
import 'package:meta/meta.dart';

/// {@template rest_client_dio}
/// Rest client that uses [Dio] as HTTP library.
/// {@endtemplate}
final class RestClientDio extends RestClientBase {
  /// {@macro rest_client_dio}
  RestClientDio({required super.baseUrl, required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Send [Dio] request
  @protected
  @visibleForTesting
  Future<Map<String, Object?>?> sendRequest<T extends Object>({
    required String path,
    required String method,
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    List<String>? pathsToFiles,
  }) async {
    try {
      final uri = buildUri(path: path, queryParams: queryParams);

      final options = Options(
        headers: headers,
        method: method,
        contentType: 'application/json',
        responseType: ResponseType.json,
      );

      FormData? formData;

      if (pathsToFiles != null) {
        formData = FormData();
        body!.forEach((key, value) {
          formData!.fields.add(MapEntry(key, value.toString()));
        });
        for (var path in pathsToFiles) {
          formData.files.add(
            MapEntry(
              'files',
              await MultipartFile.fromFile(
                path,
                filename: path.split('/').last,
              ),
            ),
          );
        }
      }
      final response = await _dio.request<T>(
        uri.toString(),
        data: formData ?? body,
        options: options,
      );
      return decodeResponse(response.data, statusCode: response.statusCode);
    } on ClientException {
      rethrow;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        Error.throwWithStackTrace(
          ConnectionException(
            message: 'ConnectionException: $e',
            statusCode: e.response?.statusCode,
          ),
          e.stackTrace,
        );
      }
      if (e.response != null) {
        final result = await decodeResponse(
          e.response?.data,
          statusCode: e.response?.statusCode,
        );

        return result;
      }
      Error.throwWithStackTrace(
        RestClientException(message: e.toString()),
        e.stackTrace,
      );
    } on Object catch (e, stack) {
      Error.throwWithStackTrace(
        RestClientException(message: e.toString()),
        stack,
      );
    }
  }

  @override
  Future<Map<String, Object?>?> delete(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'DELETE',
        headers: headers,
        queryParams: queryParams,
      );

  @override
  Future<Map<String, Object?>?> get(
    String path, {
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'GET',
        headers: headers,
        queryParams: queryParams,
      );

  @override
  Future<Map<String, Object?>?> patch(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'PATCH',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );

  @override
  Future<Map<String, Object?>?> post(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    List<String>? pathsToFiles,
  }) =>
      sendRequest(
        path: path,
        method: 'POST',
        body: body,
        headers: headers,
        queryParams: queryParams,
        pathsToFiles: pathsToFiles,
      );

  @override
  Future<Map<String, Object?>?> put(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'PUT',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );
}

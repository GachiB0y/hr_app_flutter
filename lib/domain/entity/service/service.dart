import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';

part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required int id,
    required String name,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

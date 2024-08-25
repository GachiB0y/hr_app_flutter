// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BagReportEntityImpl _$$BagReportEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$BagReportEntityImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      pathsToFiles: (json['pathsToFiles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BagReportEntityImplToJson(
        _$BagReportEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'pathsToFiles': instance.pathsToFiles,
    };

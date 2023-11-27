// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BagReportEntity _$$_BagReportEntityFromJson(Map<String, dynamic> json) =>
    _$_BagReportEntity(
      title: json['title'] as String,
      description: json['description'] as String,
      pathsToFiles: (json['pathsToFiles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_BagReportEntityToJson(_$_BagReportEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'pathsToFiles': instance.pathsToFiles,
    };

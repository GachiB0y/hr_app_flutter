// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_model_my_lean_productions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViewModelMyLeanProductions _$$_ViewModelMyLeanProductionsFromJson(
        Map<String, dynamic> json) =>
    _$_ViewModelMyLeanProductions(
      myProposals: (json['myProposals'] as List<dynamic>?)
          ?.map((e) =>
              MyLeanProductionsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSubmitting: json['isSubmitting'] as bool?,
      isLoadingFile: json['isLoadingFile'] as bool? ?? false,
      exception: $enumDecodeNullable(
          _$ApiClientExceptionTypeEnumMap, json['exception']),
    );

Map<String, dynamic> _$$_ViewModelMyLeanProductionsToJson(
        _$_ViewModelMyLeanProductions instance) =>
    <String, dynamic>{
      'myProposals': instance.myProposals,
      'isSubmitting': instance.isSubmitting,
      'isLoadingFile': instance.isLoadingFile,
      'exception': _$ApiClientExceptionTypeEnumMap[instance.exception],
    };

const _$ApiClientExceptionTypeEnumMap = {
  ApiClientExceptionType.network: 'network',
  ApiClientExceptionType.auth: 'auth',
  ApiClientExceptionType.other: 'other',
  ApiClientExceptionType.notFound: 'notFound',
  ApiClientExceptionType.addTags: 'addTags',
  ApiClientExceptionType.openFileImage: 'openFileImage',
  ApiClientExceptionType.openFileDocuments: 'openFileDocuments',
};

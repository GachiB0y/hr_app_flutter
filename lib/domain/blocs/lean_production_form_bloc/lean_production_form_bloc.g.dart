// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lean_production_form_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeanProductionFormStateLoading _$$LeanProductionFormStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$LeanProductionFormStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LeanProductionFormStateLoadingToJson(
        _$LeanProductionFormStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$LeanProductionFormStateLoaded _$$LeanProductionFormStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$LeanProductionFormStateLoaded(
      myProposals: (json['myProposals'] as List<dynamic>?)
          ?.map((e) =>
              MyLeanProductionsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSubmitting: json['isSubmitting'] as bool?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LeanProductionFormStateLoadedToJson(
        _$LeanProductionFormStateLoaded instance) =>
    <String, dynamic>{
      'myProposals': instance.myProposals,
      'isSubmitting': instance.isSubmitting,
      'runtimeType': instance.$type,
    };

_$LeanProductionFormStateError _$$LeanProductionFormStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$LeanProductionFormStateError(
      errorText: json['errorText'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LeanProductionFormStateErrorToJson(
        _$LeanProductionFormStateError instance) =>
    <String, dynamic>{
      'errorText': instance.errorText,
      'runtimeType': instance.$type,
    };

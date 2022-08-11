// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_with_status_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseWithStatusCode _$ResponseWithStatusCodeFromJson(
        Map<String, dynamic> json) =>
    ResponseWithStatusCode(
      json['errorCode'] as String?,
      (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      json['status'] as int,
    );

Map<String, dynamic> _$ResponseWithStatusCodeToJson(
        ResponseWithStatusCode instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errors': instance.errors,
      'status': instance.status,
    };

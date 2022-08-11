
import 'package:json_annotation/json_annotation.dart';

part 'response_with_status_code.g.dart';

@JsonSerializable()
class ResponseWithStatusCode{
  String? errorCode;
  Map<String, List<String>>? errors;
  int status;

  ResponseWithStatusCode(this.errorCode, this.errors, this.status);

  factory ResponseWithStatusCode.fromJson(Map<String, dynamic> json) => _$ResponseWithStatusCodeFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseWithStatusCodeToJson(this);
}
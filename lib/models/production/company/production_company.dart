import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany(this.id, this.logoPath, this.name, this.originCountry);

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
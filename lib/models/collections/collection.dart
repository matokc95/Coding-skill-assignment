import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  Collection(this.id, this.name, this.posterPath, this.backdropPath);

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
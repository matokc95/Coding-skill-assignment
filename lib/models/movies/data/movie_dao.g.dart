// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDao _$MovieDaoFromJson(Map<String, dynamic> json) => MovieDao(
      json['id'] as int,
      json['adult'] as int,
      json['backdropPath'] as String?,
      json['originalLanguage'] as String?,
      json['originalTitle'] as String?,
      json['overview'] as String,
      json['genre'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['posterPath'] as String?,
      json['releaseDate'] as String?,
      json['title'] as String?,
      json['video'] as int?,
      (json['voteAverage'] as num?)?.toDouble(),
      json['voteCount'] as int?,
      json['favourite'] as int?,
    );

Map<String, dynamic> _$MovieDaoToJson(MovieDao instance) => <String, dynamic>{
      'id': instance.id,
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'genre': instance.genre,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'favourite': instance.favourite,
    };

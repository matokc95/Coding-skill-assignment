import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  int id;
  bool adult;
  String? backdropPath;
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  String overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;


  Movie(
      this.id,
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  static formattedMovieToJson(MovieExtended movieExtended){
    return <String, dynamic>{
      'id': movieExtended.movie.id,
      'adult': movieExtended.movie.adult,
      'backdropPath': movieExtended.movie.backdropPath,
      'genre': movieExtended.genre != null ? movieExtended.genre!.name : "",
      'originalLanguage': movieExtended.movie.originalLanguage,
      'originalTitle': movieExtended.movie.originalTitle,
      'overview': movieExtended.movie.overview,
      'popularity': movieExtended.movie.popularity,
      'posterPath': movieExtended.movie.posterPath,
      'releaseDate': movieExtended.movie.releaseDate?.toIso8601String(),
      'title': movieExtended.movie.title,
      'video': movieExtended.movie.video,
      'voteAverage': movieExtended.movie.voteAverage,
      'voteCount': movieExtended.movie.voteCount,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
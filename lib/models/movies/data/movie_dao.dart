import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_dao.g.dart';

@JsonSerializable()
class MovieDao {
  int id;
  int adult;
  String? backdropPath;
  String? genre;
  String? originalLanguage;
  String? originalTitle;
  String overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  int? video;
  double? voteAverage;
  int? voteCount;
  int? favourite;


  MovieDao(
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.genre,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.favourite);


  factory MovieDao.fromJson(Map<String, dynamic> json) => _$MovieDaoFromJson(json);


  Map<String, dynamic> toJson() => _$MovieDaoToJson(this);
}
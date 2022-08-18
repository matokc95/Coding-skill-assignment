import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../collections/collection.dart';

part 'movie_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetails {

  bool adult;
  String? backdropPath;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;


  MovieDetails(
      this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

  static Movie movieDetailsToMovie(MovieDetails movieDetails){
    return Movie(
      movieDetails.id,
      movieDetails.adult,
      movieDetails.backdropPath,
      (movieDetails.genres).map((e) => e.id).toList(),
      movieDetails.originalLanguage,
      movieDetails.originalTitle,
      movieDetails.overview,
      (movieDetails.popularity).toDouble(),
      movieDetails.posterPath,
      movieDetails.releaseDate,
      movieDetails.title,
      movieDetails.video,
      (movieDetails.voteAverage).toDouble(),
      movieDetails.voteCount,
    );
  }

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
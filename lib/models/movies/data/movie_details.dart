import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movie_language/spoken_language.dart';
import 'package:assignment/models/production/company/production_company.dart';
import 'package:assignment/models/production/country/production_country.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../collections/collection.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetails {

  bool adult;
  Collection? backdropPath;
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
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
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
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
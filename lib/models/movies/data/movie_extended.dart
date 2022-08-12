import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';

class MovieExtended{
  Movie movie;
  Genre? genre;

  MovieExtended(this.movie, this.genre);
}
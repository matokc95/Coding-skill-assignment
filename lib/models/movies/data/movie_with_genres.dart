import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';

class MovieWithGenres{
  Movie? movie;
  List<Genre>? genres;
  bool favourite = false;


  MovieWithGenres();
}
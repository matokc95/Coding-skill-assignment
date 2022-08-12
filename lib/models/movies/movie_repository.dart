import 'package:assignment/common/keystore.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/genres/genres_repository.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:assignment/network/q_api/dio_q_api_service.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  static const String popularMoviesPath =
      "${Constants.MOVIES_API_PATH}/popular";

  static Future<List<MovieExtended>?> getPopularMovies({required int pageNumber}) async {
    List<MovieExtended> movies = [];

    final queryParameters = {
      'api_key': Constants.API_KEY,
      'language': "en_US",
      "page": pageNumber
    };

    var response = await DioQApiService()
        .getRequest(_getPopularMoviesPath(), queryParameters: queryParameters);

    if (response is Response) {
      if (response.statusCode == 200) {
        // Map<String, dynamic> responseJson = json.decode(response.data);
        // print("responseJson: " + responseJson.toString());

        // if (responseJson.containsKey('items')){
        //   var items = responseJson['items'];
        if (response.data.containsKey('results')) {
          var items = response.data['results'];
          List<Movie> moviesFromApi =
              List<Movie>.from(items.map((model) => Movie.fromJson(model)));

          List<Genre>? genresFromApi = await GenresRepository.getGenres();
          for(Movie movie in moviesFromApi){
            if(movie.genreIds != null){
              for(int genreId in movie.genreIds!){
                MovieExtended movieExtended = MovieExtended(movie, genresFromApi!.firstWhere((element) => element.id == genreId));
                movies.add(movieExtended);
              }
            }else{
              MovieExtended movieExtended = MovieExtended(movie, null);
              movies.add(movieExtended);
            }


          }
          movies.sort((a, b) => a.movie.id.compareTo(b.movie.id));



        }
      } else {
        print("response Status code: " + response.statusCode.toString());
      }

      return movies;
    } else {
      return null;
    }
  }

  static String _getPopularMoviesPath() {
    return popularMoviesPath;
  }
}

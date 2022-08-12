import 'package:assignment/common/keystore.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/network/q_api/dio_q_api_service.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  static const String popularMoviesPath =
      "${Constants.MOVIES_API_PATH}/popular";

  static Future<List<Movie>?> getPopularMovies({required int pageNumber}) async {
    List<Movie> moviesFromApi = [];

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
          moviesFromApi =
              List<Movie>.from(items.map((model) => Movie.fromJson(model)));
        }
      } else {
        print("response Status code: " + response.statusCode.toString());
      }

      return moviesFromApi;
    } else {
      return null;
    }
  }

  static String _getPopularMoviesPath() {
    return popularMoviesPath;
  }
}

import 'package:assignment/constants/constants.dart';
import 'package:assignment/network/q_api/dio_q_api_service.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  static const String popularMoviesPath =
      "${Constants.MOVIES_API_PATH}/popular";

  static getPopularMovies(String apiKey, int page) async {
    final queryParameters = {
      'api_key': apiKey,
      'language': "en_US",
      "page": page
    };

    var response = await DioQApiService()
        .getRequest(_getPopularMoviesPath(), queryParameters: queryParameters);

    if (response is Response) {

    }
  }

  static String _getPopularMoviesPath() {
    return popularMoviesPath;
  }
}

import 'package:assignment/constants/constants.dart';
import 'package:assignment/database/database_service.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/network/q_api/dio_q_api_service.dart';
import 'package:dio/dio.dart';

class GenresRepository {
  static const String genresPath =
      "${Constants.GENRES_API_PATH}/list";

  static Future<List<Genre>?> getGenres() async {
    List<Genre> genresFromApi = [];

    var response = await DioQApiService()
        .getRequest(_getGenresPath());

    if (response is Response) {
      if (response.statusCode == 200) {
        // Map<String, dynamic> responseJson = json.decode(response.data);
        // print("responseJson: " + responseJson.toString());

        // if (responseJson.containsKey('items')){
        //   var items = responseJson['items'];
        if (response.data.containsKey('genres')) {
          var items = response.data['genres'];
          genresFromApi =
          List<Genre>.from(items.map((model) => Genre.fromJson(model)));
          for(Genre genre in genresFromApi){
            DatabaseService _databaseService = DatabaseService();
            _databaseService.insertGenre(genre);
          }

        }
      } else {
        print("response Status code: " + response.statusCode.toString());
      }

      return genresFromApi;
    } else {
      return null;
    }
  }

  static String _getGenresPath() {
    return genresPath;
  }
}
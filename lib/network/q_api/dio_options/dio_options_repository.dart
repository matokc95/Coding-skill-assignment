import 'package:dio/dio.dart';

class DioOptionsRepository {

  static Options reportingOptions = Options(
      responseType: ResponseType.bytes,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      });
}

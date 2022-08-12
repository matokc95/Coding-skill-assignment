import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

import '../../main.dart';
import '../error_response_wrapper.dart';
import 'dio_q_api.dart';

class DioQApiService {
  static const String noRecordFound = 'Opps no record found..!!';
  static const String somethingWentWrong = 'Something went wrong.';

  Future<dynamic> getRequest(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var dio = serviceLocatorInstance<DioQApi>().dio;
      dio.options.headers["Content-Type"] = "application/json";
      if(uri.contains("genre")){
        dio.options.headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOGQ3Zjc2OTQ3OTA0YTAxMTI4NmRjNzMyYzU1MjM0ZSIsInN1YiI6IjYwMzM3ODBiMTEzODZjMDAzZjk0ZmM2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XYuIrLxvowrkevwKx-KhOiOGZ2Tn-R8tEksXq842kX4";
      }
      var response = await dio.get(
            uri,
            queryParameters: queryParameters,
            options: options,
            //cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );

      return response;
    } on SocketException catch (_) {
      return OnErrorWrapper(message: somethingWentWrong);
    } on DioError catch (err) {
      return _returnDioErrorResponse(err);
    } catch (e) {
      return OnErrorWrapper(message: somethingWentWrong);
    }
  }

  Future<dynamic> postRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
        bool hasAttachment = false
  }) async {
    try {
      var dio = serviceLocatorInstance<DioQApi>().dio;
      if(hasAttachment){
        dio.options.headers["Content-Type"] = "multipart/form-data";
      }else{
        dio.options.headers["Content-Type"] = "application/json";
      }

      Response response = await dio.post(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );

      return response;
    } on SocketException catch (_) {
      return OnErrorWrapper(message: somethingWentWrong);
    } on DioError catch (err) {
      // return err;
      return _returnDioErrorResponse(err);
    } catch (e) {
      return OnErrorWrapper(message: somethingWentWrong);
    }
  }

  Future<dynamic> putRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var dio = serviceLocatorInstance<DioQApi>().dio;
      dio.options.headers["Content-Type"] = "application/json";
      Response response = await dio.put(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );

      return response;
    } on SocketException catch (_) {
      return OnErrorWrapper(message: somethingWentWrong);
    } on DioError catch (err) {
      // return err;
      return _returnDioErrorResponse(err);
    } catch (e) {
      return OnErrorWrapper(message: somethingWentWrong);
    }
  }

  Future<dynamic> patchRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var dio = serviceLocatorInstance<DioQApi>().dio;
      dio.options.headers["Content-Type"] = "application/json-patch+json";
      Response response = await dio.patch(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress
          );

      return response;
    } on SocketException catch (_) {
      return OnErrorWrapper(message: somethingWentWrong);
    } on DioError catch (err) {
      // return err;
      return _returnDioErrorResponse(err);
    } catch (e) {
      return OnErrorWrapper(message: somethingWentWrong);
    }
  }

  Future<dynamic> deleteRequest(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var dio = serviceLocatorInstance<DioQApi>().dio;
      dio.options.headers["Content-Type"] = "application/json";
      Response response = await dio.delete(
            uri,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );

      // if (response.statusCode == 500 || response.statusCode == 502) {
      //   BlocProvider.of<NavigationBloc>(Get.context!).add(PageTapped(index: 5));
      // }
      return response;
    } on SocketException catch (_) {
      return OnErrorWrapper(message: somethingWentWrong);
    } on DioError catch (err) {
      // return err;
      return _returnDioErrorResponse(err);
    } catch (e) {
      return OnErrorWrapper(message: somethingWentWrong);
    }
  }

  dynamic _returnDioErrorResponse(DioError error) {
    if (error.type == DioErrorType.connectTimeout) {
      g.Get.snackbar(
          "Error", "Connection timeout!",
          colorText: g.Get.theme.colorScheme.background,
          backgroundColor: g.Get.theme.colorScheme.primary,
          snackPosition: g.SnackPosition.BOTTOM);

      return error;
      // throw FetchDataException('Error connection timeout');
    }
    switch (error.response?.statusCode) {
      case 400:
        // g.Get.snackbar(
        //     S.of(g.Get.context!).error, S.of(g.Get.context!).bad_request,
        //     colorText: g.Get.theme.colorScheme.background,
        //     backgroundColor: g.Get.theme.colorScheme.primary,
        //     snackPosition: g.SnackPosition.BOTTOM);

        return error;
      // throw BadRequestException(
      //     "${error.response!.statusMessage ?? "Bad request"}");
      case 401:
        g.Get.snackbar("Error",
           "Unauthorized request!",
            colorText: g.Get.theme.colorScheme.background,
            backgroundColor: g.Get.theme.colorScheme.primary,
            snackPosition: g.SnackPosition.BOTTOM);


        return error;
      // throw UnauthorisedException(
      //     "Unauthorised request: ${error.response!.statusCode}");
      case 403:
        g.Get.snackbar(
            "Error", "Access forbidden!",
            colorText: g.Get.theme.colorScheme.background,
            backgroundColor: g.Get.theme.colorScheme.primary,
            snackPosition: g.SnackPosition.BOTTOM);

        return error;
      // throw UnauthorisedException(
      //     "Access forbidden: ${error.response!.statusCode}");
      case 404:
        // g.Get.snackbar(S
        //     .of(g.Get.context!)
        //     .error, S
        //     .of(g.Get.context!)
        //     .api_not_found,
        //     colorText: g.Get.theme.colorScheme.background,
        //     backgroundColor: g.Get.theme.colorScheme.primary,
        //     snackPosition: g.SnackPosition.BOTTOM);
        // throw FetchDataException(
        //     "Api not found: ${error.response!.statusCode}");
        return error;
      case 500:
        g.Get.snackbar(
            "Error", "Internal server error!",
            colorText: g.Get.theme.colorScheme.background,
            backgroundColor: g.Get.theme.colorScheme.primary,
            snackPosition: g.SnackPosition.BOTTOM);

        // NavigationBloc navigationBloc =
        // BlocProvider.of<NavigationBloc>(Get.context!);
        // navigationBloc.add(PageTapped(index: 5));
        return error;
      case 502:
        g.Get.snackbar(
            "Error", "Internal server error!",
            colorText: g.Get.theme.colorScheme.background,
            backgroundColor: g.Get.theme.colorScheme.primary,
            snackPosition: g.SnackPosition.BOTTOM);

        // NavigationBloc navigationBloc =
        // BlocProvider.of<NavigationBloc>(Get.context!);
        // navigationBloc.add(PageTapped(index: 5));
        return error;
      case 503:
        // g.Get.snackbar(
        //     S.of(g.Get.context!).error, S.of(g.Get.context!).service_unavailable,
        //     colorText: g.Get.theme.colorScheme.background,
        //     backgroundColor: g.Get.theme.colorScheme.primary,
        //     snackPosition: g.SnackPosition.BOTTOM);

        // NavigationBloc navigationBloc =
        // BlocProvider.of<NavigationBloc>(Get.context!);
        // navigationBloc.add(PageTapped(index: 5));
        return error;
      default:
        g.Get.snackbar("Error", "Check internet connection!",
            colorText: g.Get.theme.colorScheme.background,
            backgroundColor: g.Get.theme.colorScheme.primary,
            snackPosition: g.SnackPosition.BOTTOM);
        return error;
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

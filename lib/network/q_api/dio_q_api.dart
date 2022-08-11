import 'dart:async';

import 'package:assignment/common/keystore.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/network/connection_status.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


class DioQApi {
  late Dio dio;

  // late Dio tokenDio;
  String? authToken;

  // String? tokenExpirationDate;
  static bool _refreshInProgress = false;

  late ConnectionStatusSingleton connectionStatus;

  // static Timer? timer;

  DateTime? lastNotificationForNetwork;

  initializeDioClientNetwork() async {
    // tokenDio = Dio();
    connectionStatus = ConnectionStatusSingleton.getInstance();
    dio = Dio();
    dio.options = setBaseOptions();
    dio.interceptors.add(LogInterceptor(
        responseBody: true, requestBody: true));
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: requestInterceptor, /*onError: errorInterceptor*/
      ),
    );
    print(dio.options.headers);
  }

  BaseOptions setBaseOptions() {
    return BaseOptions(
      // connectTimeout: 50,
      connectTimeout: 30000,
      // baseUrl: Constants.MANAGEMENT_API_PATH,
      baseUrl: Constants.BASE_URL_PATH,
    );
  }

  void requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // if (await connectionStatus.checkConnection()) {
      lastNotificationForNetwork = null;
      handler.next(options);
  }

  // dynamic errorInterceptor(
  //     DioError error, ErrorInterceptorHandler handler) async {
  //   //print(error);
  //   // Assume 401 stands for token expired
  //   if (error.response?.statusCode == 401) {
  //     var options = error.response!.requestOptions;
  //     // If the token has been updated, repeat directly.
  //     if (options.headers.containsKey('Authorization') && authToken != null) {
  //       String oldToken = options.headers['Authorization'];
  //       if (oldToken.contains(authToken!)) {
  //         // If the token has been updated, repeat directly.
  //         ///TODO Handle user has no rights refresh loop
  //         options.headers["Authorization"] = "Bearer " + authToken!;
  //         //repeat
  //         dio.fetch(options).then(
  //           (r) => handler.resolve(r),
  //           onError: (e) {
  //             handler.reject(e);
  //           },
  //         );
  //         return;
  //       }
  //     }
  //     // update token and repeat
  //     // Lock to block the incoming request until the token updated
  //     dio.lock();
  //     // dio.interceptors.responseLock.lock();
  //     // dio.interceptors.errorLock.lock();
  //     _refresh().then((value) async {
  //       if (value >= 0) {
  //         authToken = await Keystore.readValue(Constants.KEY_ACCESS_TOKEN);
  //         options.headers["Authorization"] = "Bearer " + authToken!;
  //       } else {
  //         Fluttertoast.showToast(
  //             msg: "User has no rights to access the application");
  //         await Keystore.writeValue(Constants.KEY_ACCESS_TOKEN, "");
  //         await Keystore.writeValue(Constants.KEY_ID_TOKEN, "");
  //         await Keystore.writeValue(Constants.KEY_REFRESH_TOKEN, "");
  //         await Keystore.writeValue(Constants.KEY_TOKEN_EXPIRATION, "");
  //
  //         // await FirebaseCrashlytics.instance.recordError(
  //         //     "User has no rights", null,
  //         //     reason: 'Check user rights!');
  //
  //         AuthenticationBloc authenticationBloc =
  //             BlocProvider.of<AuthenticationBloc>(Get.context!);
  //         authenticationBloc.add(LoggedOut());
  //       }
  //     }).whenComplete(() {
  //       dio.unlock();
  //       // dio.interceptors.responseLock.unlock();
  //       // dio.interceptors.errorLock.unlock();
  //     }).then((value) {
  //       //repeat
  //       dio.fetch(options).then(
  //         (r) => handler.resolve(r),
  //         onError: (e) {
  //           handler.reject(e);
  //         },
  //       );
  //     });
  //     return;
  //   }
  //   return handler.next(error);
  // }

}

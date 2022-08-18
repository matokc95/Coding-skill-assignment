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

  String? authToken;


  late ConnectionStatusSingleton connectionStatus;

  DateTime? lastNotificationForNetwork;

  initializeDioClientNetwork() async {
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
      connectTimeout: 30000,
      baseUrl: Constants.BASE_URL_PATH,
    );
  }

  void requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
      lastNotificationForNetwork = null;
      handler.next(options);
  }

}

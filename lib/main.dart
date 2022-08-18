import 'package:assignment/bloc/navigation/navigation_cubit.dart';
import 'package:assignment/network/connection_status.dart';
import 'package:assignment/providers/refresh_movie_list_item_provider.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'network/q_api/dio_q_api.dart';

final serviceLocatorInstance = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  setupDepedencies();
  await serviceLocatorInstance<DioQApi>().initializeDioClientNetwork();
  runApp(const MyApp());
}

void setupDepedencies() {
  serviceLocatorInstance.registerSingleton<DioQApi>(DioQApi());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieListItemRefreshProvider()),
      ],
      child: BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
          child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Assignment",
              supportedLocales: const [
                Locale('en', "US"), // English
                //Locale('hr', 'HR') // Croatian
                // ... other locales the app supports
              ],
              //locale: _locale,
              home: SplashScreen())),
    );
  }
}

import 'package:assignment/bloc/navigation/navigation_cubit.dart';
import 'package:assignment/common/app_export.dart';
import 'package:assignment/common/keystore.dart';
import 'package:assignment/common/navigation/nav_bar_items.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/database/database_service.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:assignment/models/movies/movie_repository.dart';
import 'package:assignment/screens/movies/favourites/favourites_screen.dart';
import 'package:assignment/screens/movies/popular/popular_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  late DatabaseService _databaseService;

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
        bottomNavigationBar: getCustomNavBar(),
        body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
          if (state.navbarItem == NavbarItem.movies) {
            return PopularScreen();
          } else if (state.navbarItem == NavbarItem.favourites) {
            return FavouritesScreen();
          }
          return Container();
        }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  getCustomNavBar(){
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: ColorConstant.black900,

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getVerticalSize(
              2.00,
            ),
            width: getHorizontalSize(
              110.00,
            ),
            margin: getMargin(
              left: 38,
              right: 38,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.orangeA200,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  1.00,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: getPadding(
                left: 38,
                top: 18,
                right: 38,
                bottom: 21,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 1,
                      bottom: 1,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _selectedTab = 0;
                        });
                        BlocProvider.of<NavigationCubit>(context)
                            .getNavBarItem(NavbarItem.movies);
                      },
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.imgFolder16X20,
                            height: getVerticalSize(
                              16.00,
                            ),
                            width: getHorizontalSize(
                              20.00,
                            ),
                            color: _selectedTab == 0 ? ColorConstant.orangeA200 : ColorConstant.indigo50,
                          ),
                          Padding(
                            padding: getPadding(
                              left: 10,
                              top: 1,
                              bottom: 2,
                            ),
                            child: Text(
                              "Movies",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: _selectedTab == 0 ? ColorConstant.orangeA200 : ColorConstant.indigo50,
                                fontSize: getFontSize(
                                  12,
                                ),
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w600,
                                height: 1.00,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _selectedTab = 1;
                      });
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.favourites);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonImageView(
                          svgPath: ImageConstant.imgMap,
                          height: getVerticalSize(
                            18.00,
                          ),
                          width: getHorizontalSize(
                            17.00,
                          ),
                          color: _selectedTab == 1 ? ColorConstant.orangeA200 : ColorConstant.indigo50,
                        ),
                        Padding(
                          padding: getPadding(
                            left: 9,
                            top: 3,
                            bottom: 3,
                          ),
                          child: Text(
                            "Favourites",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color:  _selectedTab == 1 ? ColorConstant.orangeA200 : ColorConstant.indigo50,
                              fontSize: getFontSize(
                                12,
                              ),
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w600,
                              height: 1.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getData() async {
    _databaseService = DatabaseService();
    List<MovieExtended>? movies = await MovieRepository.getPopularMovies(pageNumber: 1);
    if(movies != null){
      for(MovieExtended movieExtended in movies){
        _databaseService.insertMovie(movieExtended);
      }
    }
   
    
    await _databaseService.genres();


    print("fetched");
  }

}

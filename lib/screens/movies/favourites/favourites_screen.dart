
import 'package:assignment/common/app_export.dart';
import 'package:assignment/common/custom_button.dart';
import 'package:assignment/components/movie_list_item.dart';
import 'package:assignment/database/database_service.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/genres/genres_repository.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_dao.dart';
import 'package:assignment/models/movies/data/movie_details.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:assignment/models/movies/movie_repository.dart';
import 'package:assignment/providers/refresh_movie_list_item_provider.dart';
import 'package:assignment/screens/movies/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../../models/movies/data/movie_with_genres.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {

  late DatabaseService _databaseService;

  static const _pageSize = 20;

  final PagingController<int, MovieWithGenres> _pagingController =
  PagingController(firstPageKey: 1);


  @override
  void initState() {
    super.initState();
    _databaseService = DatabaseService();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieListItemRefreshProvider>(context, listen: true);
    if (provider.shouldRefresh) {
      _fetchPage(1);
      provider.toggleRefresh(false);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        appBar: AppBar(
          backgroundColor: ColorConstant.gray900,
          title: Padding(
            padding: getPadding(
              top: 29,
              right: 23,
            ),
            child: CommonImageView(
              svgPath: ImageConstant.imgLocation24X24,
              height: getSize(
                24.00,
              ),
              width: getSize(
                24.00,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                      left: 15,
                      right: 20,
                      bottom: 10
                  ),
                  child: Text(
                    "Favourites",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ColorConstant.indigo50,
                      fontSize: getFontSize(
                        22,
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
        body: PagedListView<int, MovieWithGenres>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<MovieWithGenres>(
              newPageProgressIndicatorBuilder: (context) {
                return Center(child: CircularProgressIndicator(color: ColorConstant.orangeA200));
              }, itemBuilder: (context, item, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(_createRoute(item));
              },
              child: MovieListItem(
                movieWithGenres: item,
              ),
            );
          }),
        )
      ),
    );
  }

  Route _createRoute(dynamic movieWithGenres) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MovieDetailsScreen(
            movieWithGenres: movieWithGenres,
          ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOutCubic;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await getFavouriteMovies(pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  Future<List<MovieWithGenres>> getFavouriteMovies(int pageKey) async {
    List<MovieWithGenres> movieWithGenres = [];

    List<MovieDao> favourites = await _databaseService.selectFavourites();

    int lastMovieId = 0;
    for(MovieDao favourite in favourites){
      MovieDetails? movieDetails = await MovieRepository.getMovieDetails(pageNumber: pageKey, movieId: favourite.id);
      if(movieDetails != null){
        if(lastMovieId != favourite.id){
          Movie movie = MovieDetails.movieDetailsToMovie(movieDetails);
          MovieWithGenres movieWithGenre = MovieWithGenres();
          movieWithGenre.movie = movie;
          movieWithGenre.genres = movieDetails.genres;
          movieWithGenre.favourite = favourite.favourite == 1 ? true : false;
          movieWithGenres.add(movieWithGenre);
          lastMovieId = favourite.id;
        }

      }

    }


    return movieWithGenres;
  }


  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

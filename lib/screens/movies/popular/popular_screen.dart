import 'package:assignment/common/app_export.dart';
import 'package:assignment/components/loading.dart';
import 'package:assignment/components/movie_list_item.dart';
import 'package:assignment/database/database_service.dart';
import 'package:assignment/models/genres/data/genre.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/data/movie_dao.dart';
import 'package:assignment/models/movies/data/movie_extended.dart';
import 'package:assignment/models/movies/data/movie_with_genres.dart';
import 'package:assignment/models/movies/movie_repository.dart';
import 'package:assignment/screens/movies/movie_details_screen.dart';
import 'package:assignment/screens/movies/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  late DatabaseService _databaseService;

  static const _pageSize = 20;

  final PagingController<int, MovieWithGenres> _pagingController =
      PagingController(firstPageKey: 1);

  int numOfMovies = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 15, right: 20, bottom: 10),
                  child: Text(
                    "Popular",
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
        backgroundColor: ColorConstant.gray900,
        body: PagedListView<int, MovieWithGenres>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<MovieWithGenres>(
              itemBuilder: (context, item, index) {
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

  Route _createRoute(MovieWithGenres movieWithGenres) {
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

  @override
  void initState() {
    super.initState();
    _databaseService = DatabaseService();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    //getMoviesFromLocalDb();
  }

  Future<List<MovieWithGenres>> getMoviesFromLocalDb(int pageKey) async {
    List<MovieWithGenres> moviesWithGenresList = [];
    List<MovieExtended>? movies =
        await MovieRepository.getPopularMovies(pageNumber: pageKey);

    var counter = Map<int, int>.fromEntries(movies!
        .toSet()
        .map<MapEntry<int, int>>(
            (k) => MapEntry(k.movie.id, movies.where((e) => e == k).length)));

    numOfMovies = counter.length;

    //Map<Movie, List<Genre>> formattedMovies = {};

    int lastMovieId = 0;
    for (MovieExtended movie in movies) {
      MovieWithGenres movieWithGenres = MovieWithGenres();
      if (movie.movie.id != lastMovieId) {
        List<Genre> genres = [];
        movies.forEach((element) {
          if (element.movie.id == movie.movie.id) {
            genres.add(element.genre!);
          }
        });
        movieWithGenres.movie = movie.movie;
        movieWithGenres.genres = genres;
        moviesWithGenresList.add(movieWithGenres);
        //formattedMovies.putIfAbsent(movie.movie, () => genres);
        lastMovieId = movie.movie.id;
      }
    }
    print("Fetched!");

    return moviesWithGenresList;
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await getMoviesFromLocalDb(pageKey);
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

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

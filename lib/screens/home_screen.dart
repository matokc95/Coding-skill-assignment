import 'package:assignment/bloc/navigation/navigation_cubit.dart';
import 'package:assignment/common/keystore.dart';
import 'package:assignment/common/navigation/nav_bar_items.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/models/movies/data/movie.dart';
import 'package:assignment/models/movies/movie_repository.dart';
import 'package:assignment/screens/favourites/favourites_screen.dart';
import 'package:assignment/screens/popular/popular_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie,
                ),
                label: 'Movies',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline_rounded,
                ),
                label: 'Favourites',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.movies);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.favourites);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.movies) {
          return PopularScreen();
        } else if (state.navbarItem == NavbarItem.favourites) {
          return FavouritesScreen();
        }
        return Container();
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    List<Movie>? movies = await MovieRepository.getPopularMovies(pageNumber: 1);

    print("fetched");
  }
}

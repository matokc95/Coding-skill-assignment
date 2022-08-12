import 'package:assignment/common/navigation/nav_bar_items.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.movies, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.movies:
        emit(NavigationState(NavbarItem.movies, 0));
        break;
      case NavbarItem.favourites:
        emit(NavigationState(NavbarItem.favourites, 1));
        break;
    }
  }
}
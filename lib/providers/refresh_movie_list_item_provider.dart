import 'package:flutter/material.dart';

class MovieListItemRefreshProvider extends ChangeNotifier {


  bool _shouldRefresh = false;
  // LocationData _locationData;

  bool get shouldRefresh => _shouldRefresh;
  // LocationData get locationData => _locationData;

  void toggleRefresh(bool refresh) {
    _shouldRefresh = refresh;
    // _locationData = await loc.getLocation();
    if (refresh) notifyListeners();
  }
}
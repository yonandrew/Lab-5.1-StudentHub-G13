import 'package:flutter/foundation.dart';

class NavigationProvider extends ChangeNotifier {
  NavigationProvider({int initialIndex = 0})
    : assert(initialIndex >= 0 && initialIndex < 5),
      _currentIndex = initialIndex;

  int _currentIndex;

  int get currentIndex => _currentIndex;

  void select(int index) {
    RangeError.checkValueInInterval(index, 0, 4, 'index');

    if (index == _currentIndex) return;

    _currentIndex = index;
    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';

import 'navigation_tab.dart';

abstract class CurrentTabChangeNotifier implements ChangeNotifier {
  NavigationTab get currentTab;
  void changeCurrentTab(NavigationTab newTab);
}

class CurrentTabChangeNotifierImpl
    with ChangeNotifier
    implements CurrentTabChangeNotifier {
  NavigationTab _navigationTab;
  CurrentTabChangeNotifierImpl(this._navigationTab);

  @override
  NavigationTab get currentTab => _navigationTab;

  @override
  void changeCurrentTab(NavigationTab newTab) {
    _navigationTab = newTab;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:water_jug_challenge/data/data.dart';
import 'package:water_jug_challenge/navigation/navigation_tab.dart';

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

abstract class InputsChangeNotifier implements ChangeNotifier {
  Inputs? get inputs;
  void setInputs(Inputs inputs);
}

class InputsChangeNotifierImpl
    with ChangeNotifier
    implements InputsChangeNotifier {
  Inputs? _inputs;

  @override
  Inputs? get inputs => _inputs;

  @override
  void setInputs(Inputs inputs) {
    _inputs = inputs;
    notifyListeners();
  }
}

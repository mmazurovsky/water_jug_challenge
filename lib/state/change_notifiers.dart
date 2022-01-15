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

// TODO not change notifier
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

class BucketsStatesStepsChangeNotifier with ChangeNotifier {
  List<BucketsStepState>? _stepsStates;
  int _currentStepIndex = 0;
  bool _isFinalStep = false;

  set stepsStates(List<BucketsStepState> stepsStates) {
    _stepsStates = stepsStates;
    if (_stepsStates!.length - 1 == _currentStepIndex) {
      _isFinalStep = true;
    }
  }

  List<BucketsStepState> get stepsStates => _stepsStates ?? [];
  int get currentStepIndex => _currentStepIndex;
  bool get isFinalStep => _isFinalStep;

  void goToNextStep() {
    _currentStepIndex++;
    if (_stepsStates!.length - 1 == _currentStepIndex) {
      _isFinalStep = true;
    }
    notifyListeners();
  }
}

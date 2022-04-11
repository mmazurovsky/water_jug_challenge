import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:water_jug_challenge/data/entities.dart';
import 'package:water_jug_challenge/navigation/navigation_tab.dart';

@lazySingleton
class CurrentTabChangeNotifierImpl with ChangeNotifier {
  NavigationTab _navigationTab;
  CurrentTabChangeNotifierImpl(this._navigationTab);

  NavigationTab get currentTab => _navigationTab;

  void changeCurrentTab(NavigationTab newTab) {
    _navigationTab = newTab;
    notifyListeners();
  }
}

@lazySingleton
class InputsChangeNotifierImpl with ChangeNotifier {
  Inputs? _inputs;

  Inputs? get inputs => _inputs;

  void setInputs(Inputs inputs) {
    _inputs = inputs;
    notifyListeners();
  }
}

@injectable
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

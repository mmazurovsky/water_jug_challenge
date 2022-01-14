import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:water_jug_challenge/calculations/steps_to_solution_calculator.dart';
import 'package:water_jug_challenge/data/data.dart';
import 'package:water_jug_challenge/navigation/current_tab_change_notifier.dart';
import 'package:water_jug_challenge/navigation/navigation_service.dart';
import 'package:water_jug_challenge/navigation/navigation_tab.dart';

final serviceLocator = GetIt.instance;

void injectDependencies() {
  serviceLocator.registerFactoryParam<StepsToSolutionCalculator, Inputs, Null>(
    (param1, param2) => StepsToSolutionCalculatorImpl(param1),
  );

  serviceLocator.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );

  serviceLocator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(
      navKey: serviceLocator<GlobalKey<NavigatorState>>(),
    ),
  );

  serviceLocator.registerLazySingleton<CurrentTabChangeNotifier>(
      () => CurrentTabChangeNotifierImpl(NavigationTab.main));
}

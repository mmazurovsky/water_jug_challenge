// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:water_jug_challenge/state/cubit/solution_cubit.dart';

// import 'calculations/steps_to_solution_calculator.dart';
// import 'data/entities.dart';
// import 'navigation/navigation_service.dart';
// import 'navigation/navigation_tab.dart';
// import 'state/change_notifiers.dart';

// final serviceLocator = GetIt.instance;

// void injectDependencies() {
//   // Navigation
//   serviceLocator.registerLazySingleton<GlobalKey<NavigatorState>>(
//     () => GlobalKey<NavigatorState>(),
//   );

//   // State
//   serviceLocator.registerLazySingleton<CurrentTabChangeNotifier>(
//     () => CurrentTabChangeNotifierImpl(NavigationTab.main),
//   );

//   serviceLocator.registerLazySingleton<InputsChangeNotifier>(
//     () => InputsChangeNotifierImpl(),
//   );

//   serviceLocator.registerFactoryParam<SolutionCubit, Inputs, Null>(
//     (param1, param2) => SolutionCubit(
//       serviceLocator<StepsToSolutionCalculator>(param1: param1),
//     ),
//   );

//   serviceLocator.registerFactory(
//     () => BucketsStatesStepsChangeNotifier(),
//   );

//   // Service
//   serviceLocator.registerFactoryParam<StepsToSolutionCalculator, Inputs, Null>(
//     (param1, param2) => StepsToSolutionCalculatorImpl(param1),
//   );
// }

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'calculations/steps_to_solution_calculator.dart' as _i7;
import 'data/entities.dart' as _i8;
import 'dependency.dart' as _i9;
import 'navigation/navigation_tab.dart' as _i5;
import 'state/change_notifiers.dart' as _i3;
import 'state/cubit/solution_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dependencyModule = _$DependencyModule();
  gh.factory<_i3.BucketsStatesStepsChangeNotifier>(
      () => _i3.BucketsStatesStepsChangeNotifier());
  gh.lazySingleton<_i4.GlobalKey<_i4.NavigatorState>>(
      () => dependencyModule.globalKeyNavigationStateForDefaultTab);
  gh.lazySingleton<_i3.InputsChangeNotifierImpl>(
      () => _i3.InputsChangeNotifierImpl());
  gh.lazySingleton<_i5.NavigationTab>(
      () => dependencyModule.defaultNavigationTab);
  gh.factoryParam<_i6.SolutionCubit, _i7.StepsToSolutionCalculator, dynamic>(
      (_solutionCalculator, _) => _i6.SolutionCubit(_solutionCalculator));
  gh.factoryParam<_i7.StepsToSolutionCalculator, _i8.Inputs, dynamic>(
      (_inputs, _) => _i7.StepsToSolutionCalculatorImpl(_inputs));
  gh.lazySingleton<_i3.CurrentTabChangeNotifierImpl>(
      () => _i3.CurrentTabChangeNotifierImpl(get<_i5.NavigationTab>()));
  return get;
}

class _$DependencyModule extends _i9.DependencyModule {}

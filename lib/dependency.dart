import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependency.config.dart';
import 'navigation/navigation_tab.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies({String? currentEnv}) => $initGetIt(
      getIt,
      environment: currentEnv,
    );

@module
abstract class DependencyModule {
  @lazySingleton
  NavigationTab get defaultNavigationTab => NavigationTab.main;

  @lazySingleton
  GlobalKey<NavigatorState> get globalKeyNavigationStateForDefaultTab =>
      GlobalKey<NavigatorState>();
}

import 'package:flutter/material.dart';

import '../../dependency_injection.dart';
import '../navigation/my_navigation.dart';
import 'navigation_service.dart';

// left tab to right tab
enum NavigationTab { main }

extension TabItemExtension on NavigationTab {
  static const _tabRouteMap = {
    NavigationTab.main: NavigationRoute.main,
  };

  static final _navigationKey = {
    NavigationTab.main: serviceLocator<GlobalKey<NavigatorState>>(),
  };

  static final _navigationServiceMap = {
    NavigationTab.main: serviceLocator<NavigationService>(),
  };

  NavigationRoute get tabInitialNavigationRoute => _tabRouteMap[this]!;
  GlobalKey<NavigatorState> get tabNavigationKey => _navigationKey[this]!;
  NavigationService get tabNavigationService => _navigationServiceMap[this]!;
}

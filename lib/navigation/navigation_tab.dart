import 'package:flutter/material.dart';

import '../dependency.dart';
import '../navigation/my_navigation.dart';

// left tab to right tab
enum NavigationTab { main }

extension TabItemExtension on NavigationTab {
  static const _tabRouteMap = {
    NavigationTab.main: NavigationRoute.main,
  };

  static final _navigationKey = {
    NavigationTab.main: getIt<GlobalKey<NavigatorState>>(),
  };

  NavigationRoute get tabInitialNavigationRoute => _tabRouteMap[this]!;
  GlobalKey<NavigatorState> get tabNavigationKey => _navigationKey[this]!;
}

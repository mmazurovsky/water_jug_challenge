import 'package:flutter/material.dart';

import '../utils/extension_functions.dart';
import 'my_navigation.dart';

abstract class NavigationService {
  GlobalKey<NavigatorState> get navKey;
  void pushRoute({
    required NavigationRoute navRoute,
    Map<String, String>? queryParams,
  });
  void pop();
  void pushRouteForDeepLink(Uri deepLink);
}

class NavigationServiceImpl implements NavigationService {
  final GlobalKey<NavigatorState> _navKey;
  const NavigationServiceImpl({required GlobalKey<NavigatorState> navKey})
      : _navKey = navKey;

  @override
  GlobalKey<NavigatorState> get navKey => _navKey;

  @override
  void pushRoute({
    required NavigationRoute navRoute,
    Map<String, String>? queryParams,
  }) {
    final navigationUri =
        Uri(path: navRoute.path, queryParameters: queryParams).toString();
    _navKey.currentState!.pushNamed(navigationUri);
  }

  @override
  void pop() {
    _navKey.currentState!.pop();
  }

  @override
  void pushRouteForDeepLink(Uri deepLink) {
    final navigationUri = deepLink.toString();
    _navKey.currentState!.pushNamed(navigationUri);
  }
}

import 'package:flutter/material.dart';

import '../utils/extension_functions.dart';
import 'my_navigation.dart';

extension NavigationExtension on NavigatorState {
  void pushRoute({
    required NavigationRoute navRoute,
    Map<String, String>? arguments,
  }) {
    pushNamed(navRoute.path, arguments: arguments);
  }

  void pushRouteReplacement({
    required NavigationRoute navRoute,
    Object? arguments,
  }) {
    pushReplacementNamed(navRoute.path, arguments: arguments);
  }

  void pushRouteForDeepLink(Uri deepLink) {
    final navigationUri = deepLink.toString();
    pushNamed(navigationUri);
  }
}

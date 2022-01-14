import 'package:flutter/material.dart';
import 'package:water_jug_challenge/screens/main_screen.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';
import 'package:water_jug_challenge/utils/extension_functions.dart';

enum NavigationRoute { main }

class RouteGenerator {
  static Route generateRoute(RouteSettings routeSettings) {
    final routeUri = routeSettings.name!.getUri;
    if (routeUri.path == NavigationRoute.main.path) {
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MainScreen(),
      );
    } else {
      return _errorRoute();
    }
  }

// TODO
  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          backgroundColor: ProjectColors.background,
          appBar: AppBar(),
          body: const Center(
            child: Text('Navigation error'),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/change_notifiers.dart';
import '../utils/extension_functions.dart';
import 'my_navigation.dart';
import 'navigation_tab.dart';

class NavigationTabScaffold extends StatelessWidget {
  const NavigationTabScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: context.watch<CurrentTabChangeNotifierImpl>().currentTab.index,
      children: const [
        NavigatorForTab(NavigationTab.main),
      ],
    );
  }
}

class NavigatorForTab extends StatelessWidget {
  final NavigationTab tab;

  const NavigatorForTab(
    this.tab, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: tab.tabNavigationKey,
      initialRoute: tab.tabInitialNavigationRoute.path,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

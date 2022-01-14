import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_jug_challenge/navigation/current_tab_change_notifier.dart';

import 'dependency_injection.dart';

class GlobalProvidersInjection extends StatelessWidget {
  final Widget child;

  const GlobalProvidersInjection({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => serviceLocator<CurrentTabChangeNotifier>(),
        ),
      ],
      child: child,
    );
  }
}

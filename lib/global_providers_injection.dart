import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependency.dart';
import 'state/change_notifiers.dart';

class GlobalProvidersInjection extends StatelessWidget {
  final Widget child;

  const GlobalProvidersInjection({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<CurrentTabChangeNotifierImpl>(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<InputsChangeNotifierImpl>(),
        ),
      ],
      child: child,
    );
  }
}

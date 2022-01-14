import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:water_jug_challenge/dependency_injection.dart';
import 'package:water_jug_challenge/global_providers_injection.dart';

import 'constants/project_strings.dart';
import 'navigation/navigation_scaffold.dart';

void main() async {
  await appConfiguration();
  runApp(const MyApp());
}

Future<void> appConfiguration() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // color for Android
    statusBarColor: Colors.white,
    // color for iOS
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalProvidersInjection(
      child: MaterialApp(
        title: ProjectStrings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NavigationTabScaffold(),
      ),
    );
  }
}

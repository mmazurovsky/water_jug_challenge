import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:water_jug_challenge/data/entities.dart';
import 'package:water_jug_challenge/navigation/my_navigation.dart';
import 'package:water_jug_challenge/navigation/navigation_extension.dart';
import 'package:water_jug_challenge/navigation/navigation_tab.dart';
import 'package:water_jug_challenge/state/change_notifiers.dart';
import 'package:water_jug_challenge/styling/widgets/buttons.dart';
import 'package:water_jug_challenge/styling/widgets/main_screen_widgets.dart';

import '../styling/project_colors.dart';
import '../styling/project_wide_widgets.dart';
import '../utils/validators.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late FocusNode _xFieldFocusNode;
  late FocusNode _yFieldFocusNode;
  late FocusNode _zFieldFocusNode;

  late TextEditingController _xFieldController;
  late TextEditingController _yFieldController;
  late TextEditingController _zFieldController;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _xFieldController = TextEditingController();
    _yFieldController = TextEditingController();
    _zFieldController = TextEditingController();

    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _xFieldController.dispose();
    _yFieldController.dispose();
    _zFieldController.dispose();
    super.dispose();
  }

  void _onStartChallenge() {
    if (_formKey.currentState?.validate() ?? false) {
      final Inputs inputs = Inputs(
        xMaxVolume: int.parse(_xFieldController.text),
        yMaxVolume: int.parse(_yFieldController.text),
        zWantedVolume: int.parse(_zFieldController.text),
      );
      context.read<InputsChangeNotifierImpl>().setInputs(inputs);
      Navigator.of(context).pushRoute(
        navRoute: NavigationRoute.solution,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ProjectHorizontalPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                const AppTitle(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                InputForm(
                  formKey: _formKey,
                  fields: [
                    ProjectTextField(
                      label: const Text('Bucket X volume'),
                      validator: ProjectValidator.intFieldValidator,
                      hintText: 'Put X volume here',
                      controller: _xFieldController,
                    ),
                    ProjectTextField(
                      label: const Text('Bucket Y volume'),
                      hintText: 'Put Y volume here',
                      validator: ProjectValidator.intFieldValidator,
                      controller: _yFieldController,
                    ),
                    ProjectTextField(
                      label: const Text('Wanted Z volume'),
                      hintText: 'Put Z volume here',
                      validator: ProjectValidator.intFieldValidator,
                      controller: _zFieldController,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ProjectElevatedButton(
                    onPressed: _onStartChallenge, text: 'Start'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

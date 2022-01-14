import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';
import 'package:water_jug_challenge/styling/project_text_styles.dart';
import 'package:water_jug_challenge/styling/project_widgets.dart';

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

  @override
  void initState() {
    super.initState();
    _xFieldFocusNode = FocusNode();
    _yFieldFocusNode = FocusNode();
    _zFieldFocusNode = FocusNode();

    _xFieldController = TextEditingController();
    _yFieldController = TextEditingController();
    _zFieldController = TextEditingController();
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Text(
                  "Let's examine my code in",
                  style: ProjectTextStyles.mainScreenTitleLine1,
                ),
                Text(
                  "Water Jug Challenge",
                  style: ProjectTextStyles.mainScreenTitleLine2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ProjectTextField(
                  label: const Text('X'),
                  hintText: 'Put X value here',
                  focusNode: _xFieldFocusNode,
                  controller: _xFieldController,
                ),
                const SizedBox(height: 10),
                ProjectTextField(
                  label: const Text('Y'),
                  hintText: 'Put Y value here',
                  focusNode: _yFieldFocusNode,
                  controller: _yFieldController,
                ),
                const SizedBox(height: 10),
                ProjectTextField(
                  label: const Text('Z'),
                  hintText: 'Put Z value here',
                  focusNode: _zFieldFocusNode,
                  controller: _zFieldController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

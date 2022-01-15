import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:water_jug_challenge/state/change_notifiers.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';

class SolutionScreen extends StatelessWidget {
  const SolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.background,
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            context.read<InputsChangeNotifier>().inputs!.xMaxVolume.toString(),
          ),
          Text(
            context.read<InputsChangeNotifier>().inputs!.yMaxVolume.toString(),
          ),
          Text(
            context.read<InputsChangeNotifier>().inputs!.zWantedVolume.toString(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_wide_widgets.dart';

import '../project_colors.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircularProgressIndicator(color: ProjectColors.secondary),
        ],
      ),
    );
  }
}

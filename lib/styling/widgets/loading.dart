import 'package:flutter/material.dart';

import '../project_colors.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: ProjectColors.secondary),
      ),
    );
  }
}

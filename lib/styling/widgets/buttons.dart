import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';
import 'package:water_jug_challenge/styling/project_text_styles.dart';

class ProjectElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const ProjectElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(57),
        primary: ProjectColors.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        text,
        style: ProjectTextStyles.button,
      ),
    );
  }
}

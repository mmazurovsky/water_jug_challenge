import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';

class ProjectTextStyles {
  static TextStyle mainScreenTitleLine1 = const TextStyle(
    color: ProjectColors.text,
    fontSize: 23,
    fontWeight: FontWeight.w600,
  );

  static TextStyle mainScreenTitleLine2 = TextStyle(
    color: ProjectColors.accent,
    fontSize: 33,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle textFields = TextStyle(
    color: ProjectColors.text,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';

class ProjectTextStyles {
  static TextStyle mainScreenTitleLine1 = TextStyle(
    color: ProjectColors.secondaryText,
    fontSize: 23,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle mainScreenTitleLine2 = TextStyle(
    fontFamily: 'LuckiestGuy',
    fontSize: 70,
    fontWeight: FontWeight.w400,
    height: 0.95,
  );

  static const TextStyle textFields = TextStyle(
    color: ProjectColors.primaryText,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle button = TextStyle(
    color: ProjectColors.buttonText,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}

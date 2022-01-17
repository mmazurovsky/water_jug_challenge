import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';

class ProjectTextStyles {
  static const TextStyle screenTitle = TextStyle(
    fontFamily: 'YesevaOne',
    fontSize: 60,
    fontWeight: FontWeight.w400,
    height: 0.95,
  );

  static final TextStyle noSolution = screenTitle.copyWith(fontSize: 40);

  static final TextStyle mainScreenSubtitle = TextStyle(
    color: ProjectColors.secondaryText,
    fontSize: 21,
    fontWeight: FontWeight.w600,
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

  static const TextStyle currentStepTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: ProjectColors.primaryText,
  );

  static final TextStyle stepTitle =
      currentStepTitle.copyWith(color: ProjectColors.secondaryText);

  static const TextStyle currentStepDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ProjectColors.primaryText,
  );

  static final TextStyle stepDescription =
      currentStepDescription.copyWith(color: ProjectColors.secondaryText);

  static final TextStyle bucketWaterMarker = TextStyle(
    color: ProjectColors.accent,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle bucketMaxMarker = TextStyle(
    color: ProjectColors.primaryText,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
}

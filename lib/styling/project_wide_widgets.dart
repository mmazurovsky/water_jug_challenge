import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';
import 'package:water_jug_challenge/styling/project_text_styles.dart';

class ProjectHorizontalPadding extends Padding {
  const ProjectHorizontalPadding({required Widget child, Key? key})
      : super(
          key: key,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: child,
        );
}

class ProjectTextField extends TextFormField {
  ProjectTextField({
    required Widget label,
    required String hintText,
    required TextEditingController controller,
    Key? key,
    String? Function(String?)? validator,
  }) : super(
          key: key,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            label: label,
            hintText: hintText,
            enabledBorder: _ProjectInputBorder(ProjectColors.border),
            focusedBorder: _ProjectInputBorder(ProjectColors.focusedBorder),
            disabledBorder: _ProjectInputBorder(ProjectColors.border),
            border: _ProjectInputBorder(ProjectColors.border),
            errorBorder: _ProjectInputBorder(ProjectColors.error),
            focusedErrorBorder: _ProjectInputBorder(ProjectColors.error),
          ),
          style: ProjectTextStyles.textFields,
          keyboardType: TextInputType.number,
        );
}

class _ProjectInputBorder extends OutlineInputBorder {
  _ProjectInputBorder(Color color)
      : super(
          borderSide: BorderSide(
            color: color,
            width: 1.8,
          ),
          borderRadius: BorderRadius.circular(8),
        );
}

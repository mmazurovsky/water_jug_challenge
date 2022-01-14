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
    Key? key,
    required Widget label,
    required String hintText,
    required FocusNode focusNode,
    
    required TextEditingController controller,
  }) : super(
          key: key,
          focusNode: focusNode,
          controller: controller,
          decoration: InputDecoration(
            label: label,
            hintText: hintText,
            border: _ProjectInputBorder(ProjectColors.borders),
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
          ),
          borderRadius: BorderRadius.circular(8),
        );
}

import 'package:flutter/material.dart';
import 'package:water_jug_challenge/styling/project_text_styles.dart';
import 'package:water_jug_challenge/styling/project_widgets.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's start",
          style: ProjectTextStyles.mainScreenSubtitle,
        ),
        const SizedBox(height: 10),
        const Text(
          "Water\nBucket\nChallenge",
          style: ProjectTextStyles.screenTitle,
        ),
      ],
    );
  }
}

class InputForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<ProjectTextField> fields;
  const InputForm({
    Key? key,
    required this.formKey,
    required this.fields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fields.length,
        itemBuilder: (context, index) {
          return fields[index];
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
      ),
    );
  }
}

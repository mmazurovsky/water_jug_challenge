import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../state/change_notifiers.dart';
import '../../utils/extension_functions.dart';
import '../project_text_styles.dart';
import '../project_wide_widgets.dart';

class StepsList extends StatelessWidget {
  const StepsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stepsStates =
        context.read<BucketsStatesStepsChangeNotifier>().stepsStates;
    final currentStepIndex =
        context.watch<BucketsStatesStepsChangeNotifier>().currentStepIndex;
    const separator = SizedBox(height: 10);
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: currentStepIndex + 1,
      itemBuilder: (_, index) {
        final stepDescription = StepDescription(
          isCurrent: index == currentStepIndex,
          stepIndex: index,
          text: stepsStates[index].action.getDescription(
                stepsStates[index].actionInitializer,
              ),
        );
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectHorizontalPadding(
                child: Text(
                  'Steps in total: ${stepsStates.length}',
                  style: ProjectTextStyles.currentStepTitle,
                ),
              ),
              separator,
              stepDescription,
            ],
          );
        } else {
          return stepDescription;
        }
      },
      separatorBuilder: (_, __) => separator,
    );
  }
}

class StepDescription extends StatelessWidget {
  final int stepIndex;
  final bool isCurrent;
  final String text;
  const StepDescription({
    Key? key,
    required this.stepIndex,
    required this.isCurrent,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectHorizontalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step ${stepIndex + 1}',
            style: isCurrent
                ? ProjectTextStyles.currentStepTitle
                : ProjectTextStyles.stepTitle,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: isCurrent
                ? ProjectTextStyles.currentStepDescription
                : ProjectTextStyles.stepDescription,
          ),
        ],
      ),
    );
  }
}

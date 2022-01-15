import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:water_jug_challenge/data/data.dart';
import 'package:water_jug_challenge/data/enums.dart';
import 'package:water_jug_challenge/dependency_injection.dart';
import 'package:water_jug_challenge/state/change_notifiers.dart';
import 'package:water_jug_challenge/state/cubit/solution_cubit.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';
import 'package:water_jug_challenge/styling/project_widgets.dart';
import 'package:water_jug_challenge/styling/widgets/buttons.dart';
import 'package:water_jug_challenge/styling/widgets/loading.dart';
import 'package:water_jug_challenge/utils/extension_functions.dart';

class SolutionScreen extends StatelessWidget {
  const SolutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _SolutionScreenProviderWrapper(
      child: _SolutionCanvas(),
    );
  }
}

class _SolutionScreenProviderWrapper extends StatelessWidget {
  final Widget child;
  const _SolutionScreenProviderWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => serviceLocator<BucketsStatesStepsChangeNotifier>(),
      child: BlocProvider(
        create: (context) => serviceLocator<SolutionCubit>(
          param1: context.read<InputsChangeNotifier>().inputs!,
        ),
        child: child,
      ),
    );
  }
}

class _SolutionCanvas extends StatefulWidget {
  const _SolutionCanvas({Key? key}) : super(key: key);

  @override
  _SolutionCanvasState createState() => _SolutionCanvasState();
}

class _SolutionCanvasState extends State<_SolutionCanvas> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SolutionCubit>(context).loadSolution();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<SolutionCubit, SolutionState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (_) {
              if (!context
                  .watch<BucketsStatesStepsChangeNotifier>()
                  .isFinalStep) {
                return ProjectHorizontalPadding(
                  child: ProjectElevatedButton(
                    onPressed: context
                        .read<BucketsStatesStepsChangeNotifier>()
                        .goToNextStep,
                    text: 'Next step',
                  ),
                );
              } else {
                return ProjectHorizontalPadding(
                  child: ProjectElevatedButton(
                    onPressed: Navigator.of(context).pop,
                    text: 'Finish',
                  ),
                );
              }
            },
            orElse: () => Container(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: ProjectColors.background,
      appBar: AppBar(),
      body: BlocBuilder<SolutionCubit, SolutionState>(
        builder: (context, state) {
          return state.when(
            loading: () => const LoadingContainer(),
            loaded: (stepsData) => SolutionContent(stepsData),
            error: (message) => const LoadingContainer(),
          );
        },
      ),
    );
  }
}

class SolutionContent extends StatefulWidget {
  final List<BucketsStepState> _stepsStates;
  const SolutionContent(this._stepsStates, {Key? key}) : super(key: key);

  @override
  State<SolutionContent> createState() => _SolutionContentState();
}

class _SolutionContentState extends State<SolutionContent> {
  @override
  void initState() {
    super.initState();
    Provider.of<BucketsStatesStepsChangeNotifier>(context, listen: false)
        .stepsStates = widget._stepsStates;
  }

  @override
  Widget build(BuildContext context) {
    final stepsStates =
        context.read<BucketsStatesStepsChangeNotifier>().stepsStates;
    final currentStepIndex =
        context.watch<BucketsStatesStepsChangeNotifier>().currentStepIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              stepsStates[currentStepIndex].xFilledVolume.toString(),
            ),
            Text(
              stepsStates[currentStepIndex].yFilledVolume.toString(),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: currentStepIndex + 1,
          itemBuilder: (_, index) {
            if (index == currentStepIndex) {
              return Text(
                stepsStates[index]
                    .action
                    .getDescription(stepsStates[index].actionInitializer),
                style: TextStyle(color: Colors.blue),
              );
            } else {
              return Text(
                stepsStates[index]
                    .action
                    .getDescription(stepsStates[index].actionInitializer),
                style: TextStyle(color: Colors.red),
              );
            }
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
        ),
      ],
    );
  }
}

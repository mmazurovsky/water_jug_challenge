import 'dart:math';

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
import 'package:water_jug_challenge/styling/project_text_styles.dart';
import 'package:water_jug_challenge/styling/project_widgets.dart';
import 'package:water_jug_challenge/styling/widgets/buttons.dart';
import 'package:water_jug_challenge/styling/widgets/loading.dart';
import 'package:water_jug_challenge/styling/widgets/solution_screen_widgets.dart';
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
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent + 60,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                      context
                          .read<BucketsStatesStepsChangeNotifier>()
                          .goToNextStep();
                    },
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
            loaded: (stepsData) =>
                SolutionContent(stepsData, _scrollController),
            error: (message) => const LoadingContainer(),
          );
        },
      ),
    );
  }
}

class SolutionContent extends StatefulWidget {
  final ScrollController _scrollController;
  final List<BucketsStepState> _stepsStates;
  const SolutionContent(this._stepsStates, this._scrollController, {Key? key})
      : super(key: key);

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
    return CustomScrollView(
      controller: widget._scrollController,
      slivers: [
        SliverPersistentHeader(pinned: true, delegate: BucketsContainer()),
        const SliverToBoxAdapter(
          child: SizedBox(height: 50),
        ),
        const SliverToBoxAdapter(
          child: StepsList(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }
}

class BucketsContainer extends SliverPersistentHeaderDelegate {
  static const double _maxHeightOfBucket = 200;
  static const double _minHeightOfBucket = 30;
  static const double _maxHeightOfBucketContainer = 266;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final xMaxVolume = context.read<InputsChangeNotifier>().inputs!.xMaxVolume;
    final yMaxVolume = context.read<InputsChangeNotifier>().inputs!.yMaxVolume;

    return ProjectHorizontalPadding(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: ProjectColors.bucketsContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Provider(
              create: (_) => BucketParameters(
                bucket: Bucket.x,
                height: max(
                  _maxHeightOfBucket * xMaxVolume / max(xMaxVolume, yMaxVolume),
                  _minHeightOfBucket,
                ),
                maxVolume: xMaxVolume,
              ),
              child: const BucketAndItsData(),
            ),
            Provider(
              create: (_) => BucketParameters(
                bucket: Bucket.y,
                height: max(
                  _maxHeightOfBucket * yMaxVolume / max(xMaxVolume, yMaxVolume),
                  _minHeightOfBucket,
                ),
                maxVolume: yMaxVolume,
              ),
              child: const BucketAndItsData(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => _maxHeightOfBucketContainer;
  @override
  double get minExtent => _maxHeightOfBucketContainer;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

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
          text: stepsStates[index]
              .action
              .getDescription(stepsStates[index].actionInitializer),
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

class BucketAndItsData extends StatelessWidget {
  const BucketAndItsData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bucketParameters = context.read<BucketParameters>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            BucketVolumes(),
            SizedBox(width: 10),
            BucketRespresentation(),
          ],
        ),
        Text('${bucketParameters.bucket.name.toUpperCase()} bucket'),
      ],
    );
  }
}

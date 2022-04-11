import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import '../calculations/steps_to_solution_calculator.dart';
import '../data/entities.dart';
import '../dependency.dart';
import '../state/change_notifiers.dart';
import '../state/cubit/solution_cubit.dart';
import '../styling/project_colors.dart';
import '../styling/project_text_styles.dart';
import '../styling/project_wide_widgets.dart';
import '../styling/widgets/buckets_widgets.dart';
import '../styling/widgets/buttons.dart';
import '../styling/widgets/loading.dart';
import '../styling/widgets/steps_widgets.dart';

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
      create: (_) => getIt<BucketsStatesStepsChangeNotifier>(),
      child: BlocProvider(
        create: (context) {
          final inputs = context.read<InputsChangeNotifierImpl>().inputs!;
          return getIt<SolutionCubit>(
            param1: getIt<StepsToSolutionCalculator>(param1: inputs),
          );
        },
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

  void _onNextStepTapped() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 60,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    context.read<BucketsStatesStepsChangeNotifier>().goToNextStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: BlocBuilder<SolutionCubit, SolutionState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (_) {
              if (!context
                  .watch<BucketsStatesStepsChangeNotifier>()
                  .isFinalStep) {
                return ProjectHorizontalPadding(
                  child: ProjectElevatedButton(
                    onPressed: _onNextStepTapped,
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
      body: SafeArea(
        child: BlocBuilder<SolutionCubit, SolutionState>(
          builder: (context, state) {
            return state.when(
              loading: () => const LoadingContainer(),
              loaded: (stepsData) =>
                  SolutionContent(stepsData, _scrollController),
              error: (message) => NoSolutionRepresentation(message),
            );
          },
        ),
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
        SliverPersistentHeader(
          pinned: true,
          delegate: BucketsContainer(),
        ),
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

class NoSolutionRepresentation extends StatelessWidget {
  final String _errorMessage;
  const NoSolutionRepresentation(this._errorMessage, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProjectHorizontalPadding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'No Solution',
            textAlign: TextAlign.center,
            style: ProjectTextStyles.noSolution,
          ),
          const SizedBox(height: 20),
          Text(
            _errorMessage,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ProjectElevatedButton(
            onPressed: Navigator.of(context).pop,
            text: 'Return back',
          ),
        ],
      ),
    );
  }
}

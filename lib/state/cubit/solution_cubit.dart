import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:water_jug_challenge/calculations/steps_to_solution_calculator.dart';
import 'package:water_jug_challenge/data/data.dart';

part 'solution_state.dart';
part 'solution_cubit.freezed.dart';

class SolutionCubit extends Cubit<SolutionState> {
  final StepsToSolutionCalculator _solutionCalculator;
  SolutionCubit(this._solutionCalculator)
      : super(const SolutionState.loading());

  void loadSolution() async {
    emit(const SolutionState.loading());
    final solutionSteps = _solutionCalculator();
    emit(SolutionState.loaded(solutionSteps));
  }
}

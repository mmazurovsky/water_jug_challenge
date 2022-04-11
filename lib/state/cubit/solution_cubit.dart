import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../calculations/steps_to_solution_calculator.dart';
import '../../data/entities.dart';
import '../../exceptions/exceptions.dart';

part 'solution_cubit.freezed.dart';
part 'solution_state.dart';

@injectable
class SolutionCubit extends Cubit<SolutionState> {
  final StepsToSolutionCalculator _solutionCalculator;
  SolutionCubit(@factoryParam this._solutionCalculator)
      : super(const SolutionState.loading());

  void loadSolution() async {
    emit(const SolutionState.loading());
    List<BucketsStepState> solutionSteps;
    try {
      solutionSteps = _solutionCalculator();
    } on NoSolutionException catch (e) {
      emit(SolutionState.error(e.message));
      return;
    } on Exception catch (e) {
      log(e.toString());
      emit(const SolutionState.error('Unknown error'));
      return;
    }
    emit(SolutionState.loaded(solutionSteps));
  }
}

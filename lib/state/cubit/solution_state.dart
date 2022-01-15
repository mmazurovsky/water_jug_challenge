part of 'solution_cubit.dart';

@freezed
class SolutionState with _$SolutionState {
  const factory SolutionState.loading() = _LoadingSolution;
  const factory SolutionState.loaded(List<BucketsStepState> steps) = _LoadedSolution;
  const factory SolutionState.error(String message) = _ErrorSolution;
}

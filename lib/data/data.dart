import 'package:freezed_annotation/freezed_annotation.dart';

import 'enums.dart';

part 'data.freezed.dart';

@freezed
class Inputs with _$Inputs {
  factory Inputs({
    required int xMaxVolume,
    required int yMaxVolume,
    required int zWantedVolume,
  }) = _Inputs;
}

@freezed
class BucketsState with _$BucketsState {
  factory BucketsState(
    int xFilledVolume,
    int yFilledVolume,
  ) = _BucketsState;
}

@freezed
class StepState with _$StepState {
  const StepState._();
  factory StepState({
    required BucketsState bucketsState,
    required Action action,
    required Bucket actionInitializer,
  }) = _StepState;

  int get xFilledVolume => bucketsState.xFilledVolume;
  int get yFilledVolume => bucketsState.yFilledVolume;
}

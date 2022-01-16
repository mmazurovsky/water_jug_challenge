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
class BucketsStepState with _$BucketsStepState {
  const BucketsStepState._();
  factory BucketsStepState({
    required BucketsState bucketsState,
    required BucketAction action,
    required Bucket actionInitializer,
  }) = _StepState;

  int get xFilledVolume => bucketsState.xFilledVolume;
  int get yFilledVolume => bucketsState.yFilledVolume;
  int getFilledVolumeOfBucket(Bucket bucket) =>
      bucket == Bucket.x ? xFilledVolume : yFilledVolume;
}

class BucketParameters {
  final Bucket _bucket;
  final int _maxVolume;
  final double _height;

  BucketParameters(
      {required Bucket bucket, required double height, required int maxVolume})
      : _bucket = bucket,
        _height = height,
        _maxVolume = maxVolume;

  Bucket get bucket => _bucket;
  int get maxVolume => _maxVolume;
  double get height => _height;
}

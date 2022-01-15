import 'dart:math';

import '../data/data.dart';
import '../data/enums.dart';
import '../exceptions/exception_messages.dart';
import '../exceptions/exceptions.dart';

abstract class StepsToSolutionCalculator {
  List<BucketsStepState> call();
}

class StepsToSolutionCalculatorImpl implements StepsToSolutionCalculator {
  final Inputs _inputs;
  late Set<BucketsState> _visited;

  int get xMaxVolume => _inputs.xMaxVolume;
  int get yMaxVolume => _inputs.yMaxVolume;
  int get zWantedVolume => _inputs.zWantedVolume;

  StepsToSolutionCalculatorImpl(this._inputs);

  @override
  List<BucketsStepState> call() {
    if (zWantedVolume > xMaxVolume && zWantedVolume > yMaxVolume) {
      throw NoSolutionException(ExceptionMessages.zMoreThanXAndY);
    } else if (zWantedVolume % xMaxVolume.gcd(yMaxVolume) != 0) {
      throw NoSolutionException(ExceptionMessages.remainderIsGreaterThanZero);
    } else if (zWantedVolume == 0) {
      // TODO work this in UI
      return [];
    }
    final solutionStartingWithXBucket = <BucketsStepState>[
      BucketsStepState(
        action: BucketAction.fill,
        actionInitializer: Bucket.x,
        bucketsState: BucketsState(xMaxVolume, 0),
      )
    ];

    // TODO can be linked list
    final solutionStartingWithYBucket = <BucketsStepState>[
      BucketsStepState(
        action: BucketAction.fill,
        actionInitializer: Bucket.y,
        bucketsState: BucketsState(0, yMaxVolume),
      )
    ];

    _visited = {
      solutionStartingWithXBucket.first.bucketsState,
      solutionStartingWithYBucket.first.bucketsState,
    };

    //TODO maybe have visited separated
    while (true) {
      // print(solutionStartingWithXBucket.last.bucketsState);
      // print(solutionStartingWithYBucket.last.bucketsState);
      // print('');
      if (_checkIfStepIsFinal(solutionStartingWithXBucket.last)) {
        return solutionStartingWithXBucket;
      } else if (_checkIfStepIsFinal(solutionStartingWithYBucket.last)) {
        return solutionStartingWithYBucket;
      } else {
        final nextStepForSolutionStartingWithXBucket =
            _resolveNewStepForBucketState(
                solutionStartingWithXBucket.last.bucketsState);
        if (nextStepForSolutionStartingWithXBucket != null) {
          solutionStartingWithXBucket
              .add(nextStepForSolutionStartingWithXBucket);
        }

        final nextStepForSolutionStartingWithYBucket =
            _resolveNewStepForBucketState(
                solutionStartingWithYBucket.last.bucketsState);
        if (nextStepForSolutionStartingWithYBucket != null) {
          solutionStartingWithYBucket
              .add(nextStepForSolutionStartingWithYBucket);
        }
      }
    }
  }

  bool _checkIfStepIsFinal(BucketsStepState step) {
    if (step.xFilledVolume == zWantedVolume ||
        step.yFilledVolume == zWantedVolume) {
      return true;
    } else {
      return false;
    }
  }

  BucketsStepState? _resolveNewStepForBucketState(BucketsState bucketsState) {
    BucketsStepState? nextStep;
    nextStep = _tryTransferWater(bucketsState);
    nextStep ??= _tryFillBucketWith0Volume(bucketsState);
    nextStep ??= _tryEmptyBucketWithMaxVolume(bucketsState);
    if (nextStep != null) {
      _visited.add(nextStep.bucketsState);
    }
    return nextStep;
  }

  BucketsStepState? _tryTransferWater(BucketsState bucketsState) {
    const action = BucketAction.transfer;
    BucketsStepState? newStep;
    if (bucketsState.xFilledVolume < xMaxVolume &&
        bucketsState.yFilledVolume > 0) {
      final transferedVolume = min(
          bucketsState.yFilledVolume, xMaxVolume - bucketsState.xFilledVolume);
      final newBucketState = BucketsState(
          bucketsState.xFilledVolume + transferedVolume,
          bucketsState.yFilledVolume - transferedVolume);
      if (!_visited.contains(newBucketState)) {
        newStep = BucketsStepState(
          bucketsState: newBucketState,
          action: action,
          actionInitializer: Bucket.y,
        );
      }
    } else if (bucketsState.yFilledVolume < yMaxVolume &&
        bucketsState.xFilledVolume > 0) {
      final transferedVolume = min(
          bucketsState.xFilledVolume, yMaxVolume - bucketsState.yFilledVolume);
      final newBucketState = BucketsState(
          bucketsState.xFilledVolume - transferedVolume,
          bucketsState.yFilledVolume + transferedVolume);
      if (!_visited.contains(newBucketState)) {
        newStep = BucketsStepState(
          bucketsState: newBucketState,
          action: action,
          actionInitializer: Bucket.x,
        );
      }
    }
    return newStep;
  }

  BucketsStepState? _tryFillBucketWith0Volume(BucketsState bucketsState) {
    const action = BucketAction.fill;
    BucketsStepState? newStep;
    if (bucketsState.xFilledVolume == 0) {
      final newBucketsState =
          BucketsState(xMaxVolume, bucketsState.yFilledVolume);
      if (!_visited.contains(newBucketsState)) {
        newStep = BucketsStepState(
          bucketsState: newBucketsState,
          action: action,
          actionInitializer: Bucket.x,
        );
      }
    } else if (bucketsState.yFilledVolume == 0) {
      final newBucketsState =
          BucketsState(bucketsState.xFilledVolume, yMaxVolume);
      if (!_visited.contains(newBucketsState)) {
        newStep = BucketsStepState(
          bucketsState: newBucketsState,
          action: action,
          actionInitializer: Bucket.y,
        );
      }
    }
    return newStep;
  }

  BucketsStepState? _tryEmptyBucketWithMaxVolume(BucketsState bucketsState) {
    const action = BucketAction.empty;
    BucketsStepState? newStep;
    if (bucketsState.xFilledVolume == xMaxVolume) {
      final newBucketsState = BucketsState(0, bucketsState.yFilledVolume);
      if (!_visited.contains(newBucketsState)) {
        newStep = BucketsStepState(
          bucketsState: newBucketsState,
          action: action,
          actionInitializer: Bucket.x,
        );
      }
    } else if (bucketsState.yFilledVolume == yMaxVolume) {
      final newBucketsState = BucketsState(bucketsState.xFilledVolume, 0);
      if (!_visited.contains(newBucketsState)) {
        newStep = BucketsStepState(
          bucketsState: newBucketsState,
          action: action,
          actionInitializer: Bucket.y,
        );
      }
    }
    return newStep;
  }
}

//TODO can we have 0 zWanted?
//TODO what if couple best solutions?
//TODO zwanted must be only in one bucket?

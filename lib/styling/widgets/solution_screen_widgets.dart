import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:water_jug_challenge/data/data.dart';
import 'package:water_jug_challenge/state/change_notifiers.dart';
import 'package:water_jug_challenge/styling/project_colors.dart';

class BucketVolumes extends StatelessWidget {
  const BucketVolumes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bucketParameters = context.read<BucketParameters>();
    final stepsStates =
        context.read<BucketsStatesStepsChangeNotifier>().stepsStates;
    final currentStepIndex =
        context.watch<BucketsStatesStepsChangeNotifier>().currentStepIndex;
    final currentVolume = stepsStates[currentStepIndex]
        .getFilledVolumeOfBucket(bucketParameters.bucket);

    return SizedBox(
      height: bucketParameters.height + 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bucketParameters.maxVolume.toString(),
            style: currentVolume != bucketParameters.maxVolume
                ? TextStyle()
                : TextStyle(
                    color: ProjectColors.accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
          ),
          if (currentVolume != bucketParameters.maxVolume)
            SizedBox(
              height: min(
                currentVolume /
                        bucketParameters.maxVolume *
                        bucketParameters.height +
                    20,
                bucketParameters.height,
              ),
              child: Text(
                currentVolume.toString(),
                style: TextStyle(
                  color: ProjectColors.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BucketRespresentation extends StatelessWidget {
  const BucketRespresentation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bucketParameters = context.read<BucketParameters>();
    final stepsStates =
        context.read<BucketsStatesStepsChangeNotifier>().stepsStates;
    final currentStepIndex =
        context.watch<BucketsStatesStepsChangeNotifier>().currentStepIndex;
    final currentVolume = stepsStates[currentStepIndex]
        .getFilledVolumeOfBucket(bucketParameters.bucket);

    return ClipRRect(
      borderRadius: const BucketBottomBorderRadius(),
      child: Container(
        width: 100,
        height: bucketParameters.height,
        decoration: BoxDecoration(
          color: ProjectColors.bucket,
        ),
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: currentVolume /
              bucketParameters.maxVolume *
              bucketParameters.height,
          decoration: BoxDecoration(
            color: ProjectColors.accent,
          ),
        ),
      ),
    );
  }
}

class BucketBottomBorderRadius extends BorderRadius {
  static const _radius = Radius.circular(8);
  const BucketBottomBorderRadius()
      : super.only(
          bottomLeft: _radius,
          bottomRight: _radius,
        );
}

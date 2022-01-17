import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../data/data.dart';
import '../../data/enums.dart';
import '../../state/change_notifiers.dart';
import '../project_colors.dart';
import '../project_text_styles.dart';
import '../project_wide_widgets.dart';

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
                ? ProjectTextStyles.bucketMaxMarker
                : ProjectTextStyles.bucketWaterMarker,
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
                style: ProjectTextStyles.bucketWaterMarker,
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
      borderRadius: const _BucketBottomBorderRadius(),
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

class _BucketBottomBorderRadius extends BorderRadius {
  static const _radius = Radius.circular(8);
  const _BucketBottomBorderRadius()
      : super.only(
          bottomLeft: _radius,
          bottomRight: _radius,
        );
}

class BucketsContainer extends SliverPersistentHeaderDelegate {
  static const double _maxHeightOfBucket = 200;
  static const double _minHeightOfBucket = 30;
  static const double _maxHeightOfBucketContainer = 276;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final xMaxVolume = context.read<InputsChangeNotifier>().inputs!.xMaxVolume;
    final yMaxVolume = context.read<InputsChangeNotifier>().inputs!.yMaxVolume;

    return Container(
      color: ProjectColors.background,
      child: ProjectHorizontalPadding(
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
                    _maxHeightOfBucket *
                        xMaxVolume /
                        max(xMaxVolume, yMaxVolume),
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
                    _maxHeightOfBucket *
                        yMaxVolume /
                        max(xMaxVolume, yMaxVolume),
                    _minHeightOfBucket,
                  ),
                  maxVolume: yMaxVolume,
                ),
                child: const BucketAndItsData(),
              ),
            ],
          ),
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

class BucketAndItsData extends StatelessWidget {
  const BucketAndItsData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bucketParameters = context.read<BucketParameters>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${bucketParameters.bucket.name.toUpperCase()} bucket'),
        const SizedBox(height: 10),
        Row(
          children: const [
            BucketVolumes(),
            SizedBox(width: 10),
            BucketRespresentation(),
          ],
        ),
      ],
    );
  }
}

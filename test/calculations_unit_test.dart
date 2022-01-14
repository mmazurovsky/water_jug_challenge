import 'package:flutter_test/flutter_test.dart';
import 'package:water_jug_challenge/calculations/steps_to_solution_calculator.dart';
import 'package:water_jug_challenge/data/data.dart';
import 'package:water_jug_challenge/dependency_injection.dart';
import 'package:water_jug_challenge/exceptions/exception_messages.dart';
import 'package:water_jug_challenge/exceptions/exceptions.dart';

void main() {
  injectDependencies();

  test(
      'Given inputs 3, 5, 6 When calculation triggered Then NoSolutionException must be thrown with zMoreThanXAndY message',
      () {
    final inputs = Inputs(xMaxVolume: 3, yMaxVolume: 5, zWantedVolume: 6);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);

    expect(
      () => stepsCalculator(),
      throwsA(
        predicate((e) =>
            e is NoSolutionException &&
            e.message == ExceptionMessages.zMoreThanXAndY),
      ),
    );
  });

  test(
      'Given inputs 3, 6, 4 When calculation triggered Then NoSolutionException must be thrown with remainderIsGreaterThanZero message',
      () {
    final inputs = Inputs(xMaxVolume: 3, yMaxVolume: 6, zWantedVolume: 4);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);

    expect(
      () => stepsCalculator(),
      throwsA(
        predicate((e) =>
            e is NoSolutionException &&
            e.message == ExceptionMessages.remainderIsGreaterThanZero),
      ),
    );
  });

// z is 0
  test(
      'Given inputs 3, 5, 0 When calculation triggered Then number of steps in resulted algorithm must be 0',
      () {
    final inputs = Inputs(xMaxVolume: 3, yMaxVolume: 5, zWantedVolume: 0);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();

    expect(steps.length, 0);
  });

// only 1 step required
  test(
      'Given inputs 3, 5, 5 When calculation triggered Then number of steps in resulted algorithm must be 1',
      () {
    final inputs = Inputs(xMaxVolume: 3, yMaxVolume: 5, zWantedVolume: 5);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();

    expect(steps.length, 1);
  });

  // odd, odd, even
  test(
      'Given inputs 3, 5, 4 When calculation triggered Then number of steps in resulted algorithm must be 6',
      () {
    final inputs = Inputs(xMaxVolume: 3, yMaxVolume: 5, zWantedVolume: 4);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();

    expect(steps.length, 6);
  });

  // rearranged x and y based on the test above
  test(
      'Given inputs 5, 3, 4 When calculation triggered Then number of steps in resulted algorithm must be 6',
      () {
    final inputs = Inputs(xMaxVolume: 5, yMaxVolume: 3, zWantedVolume: 4);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();
    expect(steps.length, 6);
  });

// odd, even, even
  test(
      'Given inputs 7, 4, 6 When calculation triggered Then number of steps in resulted algorithm must be 6',
      () {
    final inputs = Inputs(xMaxVolume: 7, yMaxVolume: 4, zWantedVolume: 6);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();
    expect(steps.length, 6);
  });

// odd, even, odd
  test(
      'Given inputs 5, 2, 1 When calculation triggered Then number of steps in resulted algorithm must be 4',
      () {
    final inputs = Inputs(xMaxVolume: 5, yMaxVolume: 2, zWantedVolume: 1);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();
    expect(steps.length, 4);
  });

// all even
  test(
      'Given inputs 2, 12, 6 When calculation triggered Then number of steps in resulted algorithm must be 6',
      () {
    final inputs = Inputs(xMaxVolume: 2, yMaxVolume: 12, zWantedVolume: 6);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();
    expect(steps.length, 6);
  });

// all odd
  test(
      'Given inputs 31, 7, 5 When calculation triggered Then number of steps in resulted algorithm must be 32',
      () {
    final inputs = Inputs(xMaxVolume: 31, yMaxVolume: 7, zWantedVolume: 5);
    final stepsCalculator = serviceLocator<StepsToSolutionCalculator>(param1: inputs);
    final steps = stepsCalculator();
    expect(steps.length, 32);
  });
}

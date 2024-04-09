import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:progress_line/progress_line.dart';

void main() {
  final colors = [
    Colors.red, // >= 0.0 - < 0.25
    Colors.orange, // >= 0.25 - < 0.5
    Colors.lightGreen, // >= 0.5 - < 0.75
    Colors.green, // >= 0.75 - < 1.0
  ];

  group(
    'Check `progressLineColors()` functionality',
    () {
      test(
        'It should return `Colors.red` because the percentage is in the range of 0.2',
        () {
          // arrange
          const percent = 0.2;

          // act
          final result = progressLineColors(colors: colors, percent: percent);

          // assert
          expect(result, Colors.red);
        },
      );

      test(
        'It should return `Colors.orange` because the percentage is in the range of 0.3',
        () {
          // arrange
          const percent = 0.3;

          // act
          final result = progressLineColors(colors: colors, percent: percent);

          // assert
          expect(result, Colors.orange);
        },
      );

      test(
        'It should return `Colors.lightGreen` because the percentage is in the range of 0.5',
        () {
          // arrange
          const percent = 0.5;

          // act
          final result = progressLineColors(colors: colors, percent: percent);

          // assert
          expect(result, Colors.lightGreen);
        },
      );

      test(
        'It should return `Colors.green` because the percentage is in the range of 0.75',
        () {
          // arrange
          const percent = 0.75;

          // act
          final result = progressLineColors(colors: colors, percent: percent);

          // assert
          expect(result, Colors.green);
        },
      );

      test(
        'It should return `Colors.lightGreen` because the percentage is in the range of 0.74',
        () {
          // arrange
          const percent = 0.74;

          // act
          final result = progressLineColors(colors: colors, percent: percent);

          // assert
          expect(result, Colors.lightGreen);
        },
      );

      test(
        'It should return `Colors.cyan` by default because color list is empty',
        () {
          // arrange
          const percent = 0.2;

          // act
          final result = progressLineColors(colors: [], percent: percent);

          // assert
          expect(result, Colors.cyan);
        },
      );

      test(
        'It should return `Colors.cyan` by default because the percentage is in invalid range & color list is empty',
        () {
          // arrange
          const percent = 1.2;

          // act
          final result = progressLineColors(colors: [], percent: percent);

          // assert
          expect(result, Colors.cyan);
        },
      );

      test(
        'It should return `Colors.cyan` by default because the percentage is in invalid range',
        () {
          // arrange
          const percent = 1.2;

          // act
          final result = progressLineColors(colors: [
            Colors.red,
            Colors.pink,
            Colors.purple,
          ], percent: percent);

          // assert
          expect(result, Colors.cyan);
        },
      );
    },
  );
}

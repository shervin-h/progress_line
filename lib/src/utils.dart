import 'package:flutter/material.dart';

/// ## [progressLineColors] Function Documentation
///
/// The `progressLineColors` function calculates the color for a progress line based on the
/// specified percentage and a list of gradient colors.
///
/// ### Parameters:
/// - `colors`: A list of `Color` objects representing the gradient colors.
/// - `percent`: A double value representing the percentage of progress completed.
///
/// ### Returns:
/// A `Color` object representing the color of the radial progress line at the given percentage.
/// If the `colors` list is empty, it returns the default color `Colors.cyan`. If the `percent` value
/// is outside the valid range [0, 1], it also returns the default color.
///
/// ### Usage Example:
///
/// ```dart
/// Color progressColor = progressLineColors(colors: [Colors.red, Colors.blue], percent: 0.5);
/// ```
///
/// Developers can use this function to determine the color of a progress line based on the
/// progress percentage and a list of gradient colors.
Color progressLineColors({
  required List<Color> colors,
  required double percent,
}) {
  Color progressLineColor = Colors.cyan;

  if (colors.isEmpty) {
    return progressLineColor;
  }

  if (percent < 0.0 || percent > 1.0) {
    return progressLineColor;
  }

  final ref = 1 / colors.length;
  for (int i = 0; i < colors.length; i++) {
    if (percent ~/ ref == i) {
      progressLineColor = colors[i];
    }
  }
  return progressLineColor;
}

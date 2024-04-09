/// Library: progress_line
///
/// A library for creating customizable progress bars in Flutter applications.
///
/// Exports:
/// - [BarPainter]: A custom painter class for drawing progress bars.
/// - [Utils]: Utility functions for progress line manipulation.
/// - [ProgressLineWidget]: A customizable progress line widget.
///
/// Example Usage:
/// ```dart
/// import 'package:progress_line/progress_line.dart';
///
/// // Create a progress line widget
/// ProgressLineWidget(
///   percent: 0.5,
///   bgColor: Colors.grey,
///   lineColors: [Colors.blue, Colors.green],
///   lineWidth: 8,
///   width: 200,
///   height: 20,
///   enableAnimation: true,
///   animationDuration: Duration(milliseconds: 500),
///   callback: (value) {
///     print('Current progress: $value');
///   },
/// )
/// ```
library progress_line;

export 'src/bar_painter.dart';
export 'src/utils.dart';
export 'src/widgets.dart';

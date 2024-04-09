import 'package:flutter/material.dart';

/// ## [BarPainter] Class Documentation
///
/// Custom painter class for drawing a horizontal bar with progress indication.
///
/// Parameters:
/// - [percent]: A double value representing the percentage of completion for the bar. Must be between 0.0 and 1.0.
/// - [bgColor]: Optional parameter specifying the background color of the bar. If not provided, defaults to grey.
/// - [lineColor]: Optional parameter specifying the color of the progress indicator line. If not provided, defaults to cyan.
/// - [width]: Optional parameter specifying the thickness of the progress indicator line. If not provided, defaults to 10.
///
/// Usage:
/// Create an instance of BarPainter and pass it to a CustomPaint widget's painter parameter to draw a horizontal bar.
///
/// Example:
/// ```dart
/// CustomPaint(
///   painter: BarPainter(percent: 0.7, bgColor: Colors.grey, lineColor: Colors.blue, width: 15),
///   size: Size(200, 30),
/// ),
/// ```
class BarPainter extends CustomPainter {
  final double percent;
  final Color? bgColor;
  final Color? lineColor;
  final double? width; // thickness

  BarPainter({
    super.repaint,
    required this.percent,
    this.bgColor,
    this.lineColor,
    this.width = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLinePaint = Paint()
      ..color = bgColor ?? Colors.grey.shade200
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width ?? 10;

    Paint completeLinePaint = Paint()
      ..color = lineColor ?? Colors.cyan
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width ?? 10;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    Offset completed = Offset(size.width * percent, size.height / 2);

    canvas.drawLine(start, end, bgLinePaint);
    canvas.drawLine(start, completed, completeLinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

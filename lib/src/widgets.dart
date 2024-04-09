import 'package:flutter/material.dart';

import 'bar_painter.dart';
import 'config.dart';
import 'utils.dart';

/// ## [ProgressLineWidget] Class Documentation
///
/// A customizable progress line widget that can display animated or static progress.
///
/// Parameters:
/// - percent: The percentage of completion for the progress line. Must be between 0.0 and 1.0.
/// - lineColors: List of colors representing the progress bar's line colors.
/// - bgColor: Background color of the progress line.
/// - lineWidth: Thickness of the progress bar's line.
/// - width: Width of the progress bar.
/// - height: Height of the progress bar.
/// - outerPadding: Padding outside the progress line.
/// - innerPadding: Padding inside the progress line.
/// - enableAnimation: Flag indicating whether to enable animation for the progress line (default is true).
/// - animationDuration: Duration of the animation.
/// - callback: Callback function that receives the current progress value during animation.
/// - start: Widget to be displayed before the progress line.
/// - end: Widget to be displayed after the progress line.
///
/// Example:
/// ```dart
/// ProgressLineWidget(
///   percent: 0.6,
///   lineColors: [Colors.blue, Colors.green],
///   bgColor: Colors.grey,
///   lineWidth: 8,
///   width: 200,
///   height: 20,
///   innerPadding: EdgeInsets.symmetric(horizontal: 16),
///   enableAnimation: true,
///   animationDuration: Duration(milliseconds: 500),
///   callback: (value) {
///     print('Current progress: $value');
///   },
/// )
/// ```
class ProgressLineWidget extends StatefulWidget {
  ProgressLineWidget({
    required this.percent,
    this.bgColor,
    this.lineColors,
    this.lineWidth,
    this.width,
    this.height,
    this.outerPadding,
    this.innerPadding,
    this.enableAnimation = true,
    this.animationDuration,
    this.callback,
    this.start,
    this.end,
    super.key,
  }) {
    assert(percent >= 0.0 && percent <= 1.0,
        'The percentage should be between 0.0 and 1.0');
  }

  ProgressLineWidget.widgets({
    required this.percent,
    required this.start,
    required this.end,
    this.bgColor,
    this.lineColors,
    this.lineWidth,
    this.width,
    this.height,
    this.outerPadding,
    this.innerPadding,
    this.enableAnimation = true,
    this.animationDuration,
    this.callback,
    super.key,
  }) {
    assert(percent >= 0.0 && percent <= 1.0,
        'The percentage should be between 0.0 and 1.0');
  }

  final double percent;
  final List<Color>? lineColors;
  final Color? bgColor;
  final double? lineWidth;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? outerPadding;
  final EdgeInsetsGeometry? innerPadding;
  final bool enableAnimation;
  final Duration? animationDuration;
  final void Function(double)? callback;

  final Widget? start;
  final Widget? end;

  @override
  State<ProgressLineWidget> createState() => _ProgressLineWidgetState();
}

class _ProgressLineWidgetState extends State<ProgressLineWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController? _animationController;
  late final Animation<double> _tweenAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.enableAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: widget.animationDuration ?? const Duration(seconds: 1),
      );
      _tweenAnimation =
          Tween(begin: 0.0, end: widget.percent).animate(_animationController!);
      _animationController.forward();

      if (widget.callback != null) {
        _tweenAnimation.addListener(() {
          widget.callback!(_tweenAnimation.value);
        });
      }
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progressBar = widget.enableAnimation
        ? AnimatedBuilder(
            animation: _animationController!,
            builder: (context, child) {
              return ProgressLine(
                percent: _tweenAnimation.value,
                bgColor: widget.bgColor,
                lineColors: widget.lineColors,
                lineWidth: widget.lineWidth,
                innerPadding: widget.innerPadding,
                width: widget.width,
                height: widget.height,
              );
            },
          )
        : ProgressLine(
            percent: widget.percent,
            bgColor: widget.bgColor,
            lineColors: widget.lineColors,
            lineWidth: widget.lineWidth,
            innerPadding: widget.innerPadding,
            width: widget.width,
            height: widget.height,
          );

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: widget.outerPadding ?? const EdgeInsets.all(0),
          child: (widget.start != null || widget.end != null)
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.start != null) widget.start!,
                    progressBar,
                    if (widget.end != null) widget.end!,
                  ],
                )
              : progressBar,
        );
      },
    );
  }
}

/// ## [ProgressLine] Class Documentation
///
/// A customizable progress line widget that displays the progress visually.
///
/// Parameters:
/// - percent: The percentage of completion for the progress bar. Must be between 0.0 and 1.0.
/// - lineColors: List of colors representing the progress bar's line colors.
/// - bgColor: Background color of the progress line.
/// - lineWidth: Thickness of the progress bar's line.
/// - width: Width of the progress line.
/// - height: Height of the progress line.
/// - innerPadding: Padding inside the progress line.
/// - enableAnimation: Flag indicating whether to enable animation for the progress line (default is true).
/// - animationDuration: Duration of the animation.
///
/// Example:
/// ```dart
/// ProgressLine(
///   percent: 0.6,
///   lineColors: [Colors.blue, Colors.green],
///   bgColor: Colors.grey,
///   lineWidth: 8,
///   width: 200,
///   height: 20,
///   innerPadding: EdgeInsets.symmetric(horizontal: 16),
///   enableAnimation: true,
///   animationDuration: Duration(milliseconds: 500),
/// )
/// ```
class ProgressLine extends StatelessWidget {
  const ProgressLine({
    required this.percent,
    this.lineColors,
    this.bgColor,
    this.lineWidth,
    this.width,
    this.height,
    this.innerPadding,
    this.enableAnimation = true,
    this.animationDuration,
    super.key,
  });

  final double percent;
  final List<Color>? lineColors;
  final Color? bgColor;
  final double? lineWidth;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? innerPadding;
  final bool enableAnimation;
  final Duration? animationDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Config.defaultWidth,
      height: height ?? Config.defaultHeight,
      padding: innerPadding ?? const EdgeInsets.symmetric(horizontal: 8),
      child: CustomPaint(
        foregroundPainter: BarPainter(
          percent: percent,
          bgColor: bgColor,
          lineColor: progressLineColors(
            colors: lineColors ?? [],
            percent: percent,
          ),
          width: lineWidth,
        ),
      ),
    );
  }
}

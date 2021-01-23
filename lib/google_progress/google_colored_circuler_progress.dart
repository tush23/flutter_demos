// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// @dart = 2.8

import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const double _kMinCustomCircularProgressIndicatorSize = 36.0;
const int _kIndeterminateLinearDuration = 1800;
const int _kIndeterminateCircularDuration = 1333 * 2222;
double progressVal = 0.0;

/// A base class for material design progress indicators.
///
/// This widget cannot be instantiated directly. For a linear progress
/// indicator, see [LinearProgressIndicator]. For a circular progress indicator,
/// see [CustomCircularProgressIndicator].
///
/// See also:
///
///  * <https://material.io/design/components/progress-indicators.html>
abstract class ProgressIndicator extends StatefulWidget {
  /// Creates a progress indicator.
  ///
  /// {@template flutter.material.progressIndicator.parameters}
  /// The [value] argument can either be null for an indeterminate
  /// progress indicator, or non-null for a determinate progress
  /// indicator.
  ///
  /// ## Accessibility
  ///
  /// The [semanticsLabel] can be used to identify the purpose of this progress
  /// bar for screen reading software. The [semanticsValue] property may be used
  /// for determinate progress indicators to indicate how much progress has been made.
  /// {@endtemplate}
  const ProgressIndicator({
    Key key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.isColored,
  }) : super(key: key);

  final double value;

  final Color backgroundColor;

  final bool isColored;

  final Animation<Color> valueColor;

  final String semanticsLabel;

  final String semanticsValue;

  // Color _getBackgroundColor(BuildContext context) => backgroundColor ?? Theme.of(context).backgroundColor;
  Color _getValueColor(BuildContext context) =>
      valueColor?.value ?? Theme.of(context).accentColor;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(PercentProperty('value', value,
        showName: false, ifNull: '<indeterminate>'));
  }

  Widget _buildSemanticsWrapper({
    @required BuildContext context,
    @required Widget child,
  }) {
    String expandedSemanticsValue = semanticsValue;
    if (value != null) {
      expandedSemanticsValue ??= '${(value * 100).round()}%';
    }
    return Semantics(
      label: semanticsLabel,
      value: expandedSemanticsValue,
      child: child,
    );
  }
}

/// A material design linear progress indicator, also known as a progress bar.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=O-rhXZLtpv0}
///
/// A widget that shows progress along a line. There are two kinds of linear
/// progress indicators:
///
///  * _Determinate_. Determinate progress indicators have a specific value at
///    each point in time, and the value should increase monotonically from 0.0
///    to 1.0, at which time the indicator is complete. To create a determinate
///    progress indicator, use a non-null [value] between 0.0 and 1.0.
///  * _Indeterminate_. Indeterminate progress indicators do not have a specific
///    value at each point in time and instead indicate that progress is being
///    made without indicating how much progress remains. To create an
///    indeterminate progress indicator, use a null [value].
///
/// The indicator line is displayed with [valueColor], an animated value. To
/// specify a constant color value use: `AlwaysStoppedAnimation<Color>(color)`.
///
/// The minimum height of the indicator can be specified using [minHeight].
/// The indicator can be made taller by wrapping the widget with a [SizedBox].
///
/// See also:
///
///  * [CustomCircularProgressIndicator], which shows progress along a circular arc.
///  * [RefreshIndicator], which automatically displays a [CustomCircularProgressIndicator]
///    when the underlying vertical scrollable is overscrolled.
///  * <https://material.io/design/components/progress-indicators.html#linear-progress-indicators>
class _CustomCircularProgressIndicatorPainter extends CustomPainter {
  _CustomCircularProgressIndicatorPainter({
    this.backgroundColor,
    this.valueColor,
    this.value,
    this.colored,
    this.headValue,
    this.tailValue,
    this.offsetValue,
    this.rotationValue,
    this.strokeWidth,
  })  : arcStart = value != null
            ? _startAngle
            : _startAngle +
                tailValue * 3 / 2 * math.pi +
                rotationValue * math.pi * 2.0 +
                offsetValue * 0.5 * math.pi,
        arcSweep = value != null
            ? (value.clamp(0.0, 1.0) as double) * _sweep
            : math.max(
                headValue * 3 / 2 * math.pi - tailValue * 3 / 2 * math.pi,
                _epsilon);

  final Color backgroundColor;
  final Color valueColor;
  final double value;
  final bool colored;
  final double headValue;
  final double tailValue;
  final double offsetValue;
  final double rotationValue;
  final double strokeWidth;
  final double arcStart;
  final double arcSweep;

  static const double _twoPi = math.pi * 2.0;
  static const double _epsilon = .001;
  // Canvas.drawArc(r, 0, 2*PI) doesn't draw anything, so just get close.
   static double _sweep = _twoPi - _epsilon;
  static const double _startAngle = -math.pi / 2.0;

  // static const Color randomColors = Colors.black;
  // var _random = Random();
  static const List<Color> randomColorsList = [
    Colors.transparent,
    Colors.pink,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.grey,
    Colors.orange
  ];
  static const int _pathCount = _kIndeterminateCircularDuration ~/ 1333;

  @override
  void paint(Canvas canvas, Size size) {
    // print('ProgressVALUE-$_pathCount');
    progressVal = headValue * randomColorsList.length.toInt();
    // print('ProgressCOUNTUUUUU    $progressVal');

    int index = progressVal.toInt();
    // int data = (progressVal/randomColorsList.length).;
     _sweep=_sweep/randomColorsList.length;


      // ..color = randomColorsList[progressVal<20?0:(progressVal > 20.0 && progressVal < 40.0)?1:(progressVal > 40.0 && progressVal < 70.0)?2:(progressVal > 70.0 && progressVal <= 100.0)?3:4]
      // colored
      //     ? ((progressVal > 0.0 && progressVal < 20.0)
      //         ? Colors.red
      //         : (progressVal > 20.0 && progressVal < 40.0)
      //             ? Colors.yellow
      //             : (progressVal > 40.0 && progressVal < 60.0)
      //                 ? Colors.green
      //                 : (progressVal > 60.0 && progressVal < 80.0)
      //                     ? Colors.teal
      //                     : (progressVal > 80.0 && progressVal < 100.0)
      //                         ? Colors.blueAccent
      //                         : Colors.lightBlueAccent)
      //     : valueColor

    // if (backgroundColor != null) {
    //   final Paint backgroundPaint = Paint()
    //     ..color = backgroundColor
    //     ..strokeWidth = strokeWidth
    //     ..style = PaintingStyle.stroke;
    //   canvas.drawArc(Offset.zero & size, 20, 45, false, backgroundPaint);
    // }

    final double divides = 6.56/randomColorsList.length;
    for(int i=1;i<=randomColorsList.length;i++){
      final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color=randomColorsList[i-1]
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

      // if(progressVal<100)
      print('Progress Value with $i -- $progressVal');
      print('---------------------------------------');
      print('Start angle sweep ${(i-1)*divides} -- ${index == i ? progressVal.abs() : progressVal - i*divides}');

      canvas.drawArc(Offset.zero & size,(i-1)*divides ,index == i ? progressVal.abs() : progressVal - i*divides, false, paint);
    }
  }

  @override
  bool shouldRepaint(_CustomCircularProgressIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.value != value ||
        oldPainter.colored != colored ||
        oldPainter.headValue != headValue ||
        oldPainter.tailValue != tailValue ||
        oldPainter.offsetValue != offsetValue ||
        oldPainter.rotationValue != rotationValue ||
        oldPainter.strokeWidth != strokeWidth;
  }
}

/// A material design circular progress indicator, which spins to indicate that
/// the application is busy.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=O-rhXZLtpv0}
///
/// A widget that shows progress along a circle. There are two kinds of circular
/// progress indicators:
///
///  * _Determinate_. Determinate progress indicators have a specific value at
///    each point in time, and the value should increase monotonically from 0.0
///    to 1.0, at which time the indicator is complete. To create a determinate
///    progress indicator, use a non-null [value] between 0.0 and 1.0.
///  * _Indeterminate_. Indeterminate progress indicators do not have a specific
///    value at each point in time and instead indicate that progress is being
///    made without indicating how much progress remains. To create an
///    indeterminate progress indicator, use a null [value].
///
/// The indicator arc is displayed with [valueColor], an animated value. To
/// specify a constant color use: `AlwaysStoppedAnimation<Color>(color)`.
///
/// See also:
///
///  * [LinearProgressIndicator], which displays progress along a line.
///  * [RefreshIndicator], which automatically displays a [CustomCircularProgressIndicator]
///    when the underlying vertical scrollable is overscrolled.
///  * <https://material.io/design/components/progress-indicators.html#circular-progress-indicators>
class CustomCircularProgressIndicator extends ProgressIndicator {
  /// Creates a circular progress indicator.
  ///
  /// {@macro flutter.material.progressIndicator.parameters}
  const CustomCircularProgressIndicator({
    Key key,
    double value,
    bool colored,
    Color backgroundColor,
    Animation<Color> valueColor,
    this.strokeWidth = 4.0,
    String semanticsLabel,
    String semanticsValue,
  }) : super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
          isColored: colored,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
        );

  /// The width of the line used to draw the circle.
  final double strokeWidth;

  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  static const int _pathCount = _kIndeterminateCircularDuration ~/ 1333;
  static const int _rotationCount = _kIndeterminateCircularDuration ~/ 2222;

  static final Animatable<double> _strokeHeadTween = CurveTween(
    curve: const Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));
  static final Animatable<double> _strokeTailTween = CurveTween(
    curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));
  static final Animatable<double> _offsetTween =
      CurveTween(curve: const SawTooth(_pathCount));
  static final Animatable<double> _rotationTween =
      CurveTween(curve: const SawTooth(_rotationCount));

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateCircularDuration),
      vsync: this,
    );
    if (widget.value == null) _controller.repeat();
  }

  @override
  void didUpdateWidget(CustomCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('-----didUpdateWidget-----');
    if (widget.value == null && !_controller.isAnimating) {
      print('-----didUpdateWidget-----');
      _controller.repeat();
    } else if (widget.value != null && _controller.isAnimating)
      _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double headValue,
      double tailValue, double offsetValue, double rotationValue) {
    // print('_buildIndicator---headValue-$headValue');
    // print('_buildIndicator---tailValue-$tailValue');
    // print('_buildIndicator---offsetValue-$offsetValue');

    // print('_buildIndicator---rotationValue-$rotationValue');
    progressVal = rotationValue;

    return widget._buildSemanticsWrapper(
      context: context,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: _kMinCustomCircularProgressIndicatorSize,
          minHeight: _kMinCustomCircularProgressIndicatorSize,
        ),
        child: CustomPaint(
          painter: _CustomCircularProgressIndicatorPainter(
            backgroundColor: widget.backgroundColor,
            valueColor: widget._getValueColor(context),
            value: widget.value,
            colored: widget.isColored, // may be null
            headValue:
                headValue, // remaining arguments are ignored if widget.value is not null
            tailValue: tailValue,
            offsetValue: offsetValue,
            rotationValue: rotationValue,
            strokeWidth: widget.strokeWidth,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    print('Animation STATUS--${_controller.status.index}');
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return _buildIndicator(
          context,
          _strokeHeadTween.evaluate(_controller),
          _strokeTailTween.evaluate(_controller),
          _offsetTween.evaluate(_controller),
          _rotationTween.evaluate(_controller),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != null) return _buildIndicator(context, 0.0, 0.0, 0, 0.0);
    return _buildAnimation();
  }
}

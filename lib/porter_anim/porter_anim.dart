import 'package:flutter/material.dart';
import 'package:flutter_demos/porter_anim/painters/bg_painter.dart';

class PorterAnim extends StatefulWidget {
  @override
  _PorterAnimState createState() => _PorterAnimState();
}

class _PorterAnimState extends State<PorterAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..forward;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller,
              ),
            ),
          ),
        ),
        Center(
          child: FlatButton(
            color: Colors.blueAccent,
            child: Text("CLick"),
            onPressed: () {
              print(_controller.isAnimating);
              print(_controller.isCompleted);
              print(_controller.isDismissed);
              _controller.reset();
              _controller.forward();
            },
          ),
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demos/porter_anim/painters/bg_painter.dart';
import 'package:flutter_demos/ripple/custop_paint.dart';

Gradient gradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.centerLeft,
  // stops: [
  //   1.8,
  //   0.7,
  // ],
  colors: [
    kSplashBgEndColor,
    kSplashBgStartColor,
  ],
);
class PorterAnim extends StatefulWidget {
  @override
  _PorterAnimState createState() => _PorterAnimState();
}

class _PorterAnimState extends State<PorterAnim> with TickerProviderStateMixin {
  AnimationController _controller;

  AnimationController _bounceController;

  @override
  void initState() {
    super.initState();
    //Icon ANimatons
    _bounceController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // _bounceController.forward();
//curve animations
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward;
    _controller.reverseDuration = Duration(milliseconds: 200);

    // _controller.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     print('--animation colpleted');
    //     _controller.reverse();
    //     _bounceController.forward();
    //   } else
    //     print('--animation NOT colpleted');
    // });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Gradient _gradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.centerLeft,
    // stops: [
    //   1.8,
    //   0.7,
    // ],
    colors: [
      kSplashBgEndColor,
      kSplashBgStartColor,
    ],
  );
  double _width = 10;
  double _height = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: _gradient),
        ),
        Center(
          child: SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: ScaleTransition(
                scale: Tween(begin: 0.75, end: 2.0).animate(CurvedAnimation(
                    parent: _bounceController, curve: Curves.elasticOut)),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.access_alarms_rounded,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              color: Colors.blueAccent,
              child: Text("CLick"),
              onPressed: () {
                print(_controller.isAnimating);
                print(_controller.isCompleted);
                print(_controller.isDismissed);
                // _controller.reset();
                _controller.forward();
              },
            ),
            FlatButton(
              color: Colors.blueAccent,
              child: Text("Reverse"),
              onPressed: () {
                // setState(() {});
                _controller.reverse();
                // _controller.forward();
              },
            ),
            FlatButton(
              color: Colors.blueAccent,
              child: Text("Icon Animations FOrword"),
              onPressed: () {
                // setState(() {});
                _bounceController.forward();
                // _controller.forward();
              },
            ),
            FlatButton(
              color: Colors.blueAccent,
              child: Text("Icon Animations Revers"),
              onPressed: () {
                // setState(() {});
                _bounceController.reverse();
                // _controller.forward();
              },
            ),
          ],
        )
      ],
    ));
  }
}

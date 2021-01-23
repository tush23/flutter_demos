import 'package:flutter/material.dart';
import 'package:flutter_demos/customs/custom_paint.dart';

class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}
class _MyPainterState extends State<MyPainter> with SingleTickerProviderStateMixin{

  AnimationController _controller ;
  Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    animation = Tween().animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_,c) {
            debugPrint("${_controller.value}");
              return CustomPaint(
                painter: ShapePainter(_controller.value*6.56),
                child: Container(),
              );
            }
          ),
        ),
      ),
    );
  }
}
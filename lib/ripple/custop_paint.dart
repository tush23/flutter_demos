import 'package:flutter/material.dart';
import 'dart:ui' as ui;

const Color kBeginColor = Color(0xffE53E4C);
const Color kSplashBgRipleColor = Color(0xffEA435D);
const Color kSplashBgColor = Color(0xffED595D);
const Color kSplashBgStartColor = Color(0xffF47051);
const Color kSplashBgEndColor = Color(0xffE2444F);
const Color kEndColor = Color(0xffFEBC44);
Color kTextFieldBgColor = Colors.grey.withOpacity(0.1);
class SplashCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(200, 200), 100, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class SplashCustom2Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      // ..shader = ui.Gradient.sweep(
      //   Offset(500, 000),
      //   [
      //     kEndColor,
      //     kSplashBgRipleColor,
      //   ],
      // )
      ..shader = ui.Gradient.radial(
        Offset(100, 600),
        1000,
        [
          kEndColor,
          kSplashBgRipleColor,
        ],
      )
      // ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawArc(
        new Rect.fromLTWH(100.0, 0.0, size.width * 4, size.height / 1.2),
        10.375,
        110.349,
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

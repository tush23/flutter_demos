import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  final double d;
  List<Color> randomColorsList = [
    Colors.transparent,
    Colors.pink,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.grey,
    Colors.orange
  ];

  ShapePainter(this.d);
  @override
  void paint(Canvas canvas, Size size) {


    // var path = Path();
    // path.addOval(Rect.fromCircle(
    //   center: Offset(size.width / 3, size.height / 4),
    //   radius: 50,
    // ));
    for(int i = 1;i <= randomColorsList.length;i++){
      final paint = Paint()
        ..color = randomColorsList[i]
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(Offset.zero & size,0,d/2,false, paint);
    }
    // canvas.drawArc(Offset.zero & size,(i-1)*divides ,index == i ? progressVal.abs() : progressVal - i*divides, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
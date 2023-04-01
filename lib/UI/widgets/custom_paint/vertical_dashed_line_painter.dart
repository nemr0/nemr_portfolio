import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class DashedLineVerticalPainter extends CustomPainter {
  DashedLineVerticalPainter({this.withCircle = true});
  final bool withCircle;
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;

    if (withCircle) {
      Paint paint0Fill = Paint()..style = PaintingStyle.fill;
      paint0Fill.shader = ui.Gradient.radial(const Offset(0, 0), 12,
          [const Color(0xff1E1E1E), const Color(0xff474242)], [0, 1]);

      canvas.drawOval(
          Rect.fromCenter(center: const Offset(0, 0), width: 12, height: 12),
          paint0Fill);
      startY += 10;
    }
    final paint = Paint()
      ..color = CupertinoColors.systemGrey2
      ..strokeWidth = size.width;
    while (startY < size.height - 1) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

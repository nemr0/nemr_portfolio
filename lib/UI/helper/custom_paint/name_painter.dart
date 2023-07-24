import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

import '../../../config/colors.dart';

/// Gradient Flag beside my name
class NamePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
      Offset(size.width * 0.5000000, 0),
      Offset(size.width * 0.5000000, size.height),
      [kPrimaryColor, kYellowColor],
      [0, 1],
    );
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

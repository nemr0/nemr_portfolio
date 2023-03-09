import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/style/constants/colors.dart';
import 'dart:ui' as ui;

class WindowPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.shader = ui.Gradient.linear(
        Offset(size.width * 0.9974359, size.height * 0.008333333),
        Offset(size.width * 0.002564103, size.height * 0.008333583), [
      kGradientColor,
      kPrimaryColor,
      kGradientColor,
    ], [
      0,
      0.46875,
      1
    ]);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001282051, size.height * 0.004166667,
                size.width * 0.9974359, size.height * 0.9916667),
            bottomRight: Radius.circular(size.width * 0.05256410),
            bottomLeft: Radius.circular(size.width * 0.05256410),
            topLeft: Radius.circular(size.width * 0.05256410),
            topRight: Radius.circular(size.width * 0.05256410)),
        paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = kContainerBgColor;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001282051, size.height * 0.004166667,
                size.width * 0.9974359, size.height * 0.9916667),
            bottomRight: Radius.circular(size.width * 0.05256410),
            bottomLeft: Radius.circular(size.width * 0.05256410),
            topLeft: Radius.circular(size.width * 0.05256410),
            topRight: Radius.circular(size.width * 0.05256410)),
        paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

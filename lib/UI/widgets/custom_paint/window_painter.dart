import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

import '../../../config/colors.dart';

/// A Window with Gradient Stroke and 15% Black

class WindowPainter extends CustomPainter {
  final bool isHover;
  final Color k6Gradient = kGradientColor.withOpacity(.6);
  final Color k7Primary = kPrimaryColor.withOpacity(.7);
  WindowPainter({required this.isHover});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint0Stroke.shader = ui.Gradient.linear(
      Offset(size.width * 0.9985122, size.height * 0.001558191),
      Offset(size.width * 0.002381162, size.height * 0.001558203),
      isHover
          ? [
              k7Primary,
              k6Gradient,
              k7Primary,
            ]
          : [
              k6Gradient,
              kPrimaryColor.withOpacity(.8),
              k6Gradient,
            ],
      [0, 0.453125, 1],
    );
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          size.width * 0.001663802,
          size.height * 0.0009469401,
          size.width * 0.9975653,
          size.height * 0.9981064,
        ),
        bottomRight: Radius.circular(size.width * 0.02941176),
        bottomLeft: Radius.circular(size.width * 0.02941176),
        topLeft: Radius.circular(size.width * 0.02941176),
        topRight: Radius.circular(size.width * 0.02941176),
      ),
      paint0Stroke,
    );

    // Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    // paint0Fill.color = CupertinoColors.black.withOpacity(isHover ? 0.15 : 0.1);
    // canvas.drawRRect(
    //     RRect.fromRectAndCorners(
    //         Rect.fromLTWH(size.width * 0.001663802, size.height * 0.0009469401,
    //             size.width * 0.9975653, size.height * 0.9981064),
    //         bottomRight: Radius.circular(size.width * 0.02941176),
    //         bottomLeft: Radius.circular(size.width * 0.02941176),
    //         topLeft: Radius.circular(size.width * 0.02941176),
    //         topRight: Radius.circular(size.width * 0.02941176)),
    //     paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

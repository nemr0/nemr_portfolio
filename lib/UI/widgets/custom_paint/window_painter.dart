import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';

import '../../../config/colors.dart';

/// A Window with Gradient Stroke and 15% Black

class WindowPainter extends CustomPainter {
  final bool isHover;

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
                kPrimaryColor.withOpacity(.7),
                kGradientColor.withOpacity(.6),
                kPrimaryColor.withOpacity(.7)
              ]
            : [
                kGradientColor.withOpacity(.6),
                kPrimaryColor.withOpacity(.8),
                kGradientColor.withOpacity(.6)
              ],
        [0, 0.453125, 1]);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.001663802, size.height * 0.0009469401,
                size.width * 0.9975653, size.height * 0.9981064),
            bottomRight: Radius.circular(size.width * 0.02941176),
            bottomLeft: Radius.circular(size.width * 0.02941176),
            topLeft: Radius.circular(size.width * 0.02941176),
            topRight: Radius.circular(size.width * 0.02941176)),
        paint0Stroke);

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

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = CupertinoColors.black.withOpacity(0.13);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.009887006, size.height * 0.008433735,
                size.width * 0.9802260, size.height * 0.9831325),
            bottomRight: Radius.circular(size.width * 0.01412429),
            bottomLeft: Radius.circular(size.width * 0.01412429),
            topLeft: Radius.circular(size.width * 0.01412429),
            topRight: Radius.circular(size.width * 0.01412429)),
        paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.shader = ui.Gradient.linear(
        Offset(size.width * 0.9900607, size.height * 0.008764578),
        Offset(size.width * 0.009406314, size.height * 0.008764590),
        [kGradientColor, kPrimaryColor, kGradientColor],
        [0, 0.453125, 1]);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.008700099, size.height * 0.008162169,
                size.width * 0.9820664, size.height * 0.9836759),
            bottomRight: Radius.circular(size.width * 0.02895480),
            bottomLeft: Radius.circular(size.width * 0.02895480),
            topLeft: Radius.circular(size.width * 0.02895480),
            topRight: Radius.circular(size.width * 0.02895480)),
        paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xff000000).withOpacity(0.130);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.008700099, size.height * 0.008162169,
                size.width * 0.9820664, size.height * 0.9836759),
            bottomRight: Radius.circular(size.width * 0.02895480),
            bottomLeft: Radius.circular(size.width * 0.02895480),
            topLeft: Radius.circular(size.width * 0.02895480),
            topRight: Radius.circular(size.width * 0.02895480)),
        paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

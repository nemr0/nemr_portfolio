import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// enabled for any container
Decoration glassBoxDecoration(

        /// use a color with 35% opacity
        {
  required Color color,
  double radius = 10,
  Size? size,
}) =>
    BoxDecoration(
      border:
          Border.all(color: CupertinoColors.white.withOpacity(.05), width: 1),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(.2),
          blurRadius: 10,
          spreadRadius: 5,
          offset: size == null ? Offset.zero : Offset(0, size.height / 2),
        ),
      ],
      gradient: LinearGradient(
        colors: [
          color.withOpacity(.08),
          color.withOpacity(.13),
        ],
        begin: AlignmentDirectional.topStart,
        end: AlignmentDirectional.bottomEnd,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );

/// Glass Morphism Effect For Button Icons
class GlassMorphism extends StatelessWidget {
  const GlassMorphism({
    Key? key,
    required this.color,
    required this.child,
    this.sigmaX = 4,
    this.sigmaY = 7,
    required this.height,
    required this.width,
    this.glassColor,
  }) : super(key: key);
  final Color color;
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final double height;
  final double width;
  final Color? glassColor;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4, sigmaY: 7, tileMode: TileMode.mirror),
        child: Container(
          height: height,
          width: width,
          decoration: glassBoxDecoration(
            color: glassColor ?? color,
            size: Size(width, height),
          ),
          padding: const EdgeInsets.all(3),
          child: child,
        ),
      ),
    );
  }
}

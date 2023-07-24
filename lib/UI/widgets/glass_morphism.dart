import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// enabled for any container
BoxDecoration glassBoxDecoration(

        /// use a color with 35% opacity
        {
  required Color color,
  double radius = 10,
  BorderRadius? borderRadius,
  Size? size,
}) =>
    BoxDecoration(
      border:
          Border.all(color: CupertinoColors.white.withOpacity(.1), width: 1),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(.2),
          blurRadius: 10,
          spreadRadius: 5,
          offset: size == null ? Offset.zero : Offset(0, size.height / 2),
        ),
      ],
      color: color,
      borderRadius: borderRadius ??= BorderRadius.all(
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
    this.height,
    this.width,
    this.glassColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final Color color;
  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final double? height;
  final double? width;
  final Color? glassColor;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: 4, sigmaY: 7, tileMode: TileMode.mirror),
          child: Container(
            height: height,
            width: width,
            decoration: glassBoxDecoration(
              color: glassColor ?? color,
              size: width == null || height == null
                  ? null
                  : Size(width!, height!),
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.all(3),
            child: child,
          ),
        ),
      ),
    );
  }
}

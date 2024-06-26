import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';

import '../../../config/colors.dart';
import '../../helper/is_mobile.dart';

/// Window Widget
class Window extends HookWidget {
  const Window({
    super.key,
    this.onlyTopRadius = true,
    this.radius = 20,
    required this.child,
    this.width,
    this.height,
    this.inColor = kContainerColor,
    this.padding = EdgeInsets.zero,
  });
  final double? width;
  final double? height;
  final Widget child;
  final bool onlyTopRadius;
  final double radius;
  final Color inColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {

    /// on hover is true else false, to give a little animation
    final hovered = useState(false);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: height,
          width: width,
          child: AnimatedPadding(
            padding: padding,
            duration: Duration(milliseconds: 200),
            child: MouseRegion(
              onHover: (p) => isMobile ? hovered.value = !hovered.value : null,
              onEnter: (p) => hovered.value = true,
              onExit: (p) => hovered.value = false,
              child: GradientBorderGlassBox(
                onlyTopRadius: onlyTopRadius,
                radius: radius,
                width: width,
                height: height,
                inColor: inColor,
                hovered: hovered.value,
                child: child,
              ),
              // if (aboutEnabled) const AboutButton(),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientBorderGlassBox extends StatelessWidget {
  const GradientBorderGlassBox({
    super.key,
    this.onlyTopRadius = true,
    this.width,
    this.height,
    this.radius = 20,
    this.inColor = kContainerColor,
    this.hovered = false,
    required this.child,
    this.borderColor = k7Primary,
    this.onTap,
  });

  final bool onlyTopRadius;
  final double radius;
  final double? width;
  final double? height;
  final Color inColor;
  final bool hovered;
  final Widget child;
  final Color borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Radius cirRadius = Radius.circular(radius);

    return Center(
      child: ClipRRect(
        borderRadius: onlyTopRadius
            ? BorderRadius.only(topLeft: cirRadius)
            : BorderRadius.all(cirRadius),
        child: Container(
          width: width,
          height: height,
          decoration: boxDecoration(color: inColor).copyWith(
            borderRadius: onlyTopRadius
                ? BorderRadius.only(
                    topLeft: cirRadius,
                  )
                : BorderRadius.all(cirRadius),
            border: GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(
                colors: hovered
                    ? [borderColor, k7Gradient, borderColor]
                    : [k7Gradient, borderColor, k7Gradient],
              ),
            ),
          ),
          // BoxDecoration(
          //   color: inColor,

          // ),
          child: InkWell(
              onTap: onTap,
              mouseCursor: onTap == null
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.click,
              child: child),
        ),
      ),
    );
  }
}

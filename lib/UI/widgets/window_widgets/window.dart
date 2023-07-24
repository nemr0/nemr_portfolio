import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';

import '../../../config/colors.dart';
import '../../helper/is_mobile.dart';
import 'about_me/about_button.dart';

/// Window Widget
class Window extends HookWidget {
  const Window({
    super.key,
    this.onlyTopRadius = true,
    this.radius = 20,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.width,
    this.height,
    this.inColor = kContainerColor,
    this.aboutEnabled = false,
    this.padding = EdgeInsets.zero,
  });

  final double? width;
  final double? height;
  final Duration duration;
  final Widget child;
  final bool onlyTopRadius;
  final double radius;
  final Color inColor;
  final bool aboutEnabled;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    /// shows if the widget is minimized using passed provider

    /// on hover is true else false, to give a little animation
    final hovered = useState(false);
    final animationCTR = useAnimationController(duration: duration);
    final animation =
        useAnimation(Tween(begin: 0.0, end: 1.0).animate(animationCTR));

    useEffect(
      () {
        ///Entry Animation
        animationCTR.forward();

        return null;
      },
      [],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: height,
          width: width,
          child: Opacity(
            opacity: animation,
            child: Padding(
              padding: padding,
              child: MouseRegion(
                onHover: (p) =>
                    isMobile ? hovered.value = !hovered.value : null,
                onEnter: (p) => hovered.value = true,
                onExit: (p) => hovered.value = false,
                child: GradientBorderGlassBox(
                  onlyTopRadius: onlyTopRadius,
                  radius: radius,
                  width: width,
                  height: height,
                  inColor: inColor,
                  hovered: hovered.value,
                  child: Stack(
                    children: [
                      Center(child: child),
                      if (aboutEnabled)
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: AboutButton(),
                        ),
                    ],
                  ),
                ),
                // if (aboutEnabled) const AboutButton(),
              ),
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
  });

  final bool onlyTopRadius;
  final double radius;
  final double? width;
  final double? height;
  final Color inColor;
  final bool hovered;
  final Widget child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final Radius cirRadius = Radius.circular(radius);

    return Center(
      child: ClipRRect(
        borderRadius: onlyTopRadius
            ? BorderRadius.vertical(top: cirRadius)
            : BorderRadius.all(cirRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
          child: Container(
            width: width,
            height: height,
            decoration: glassBoxDecoration(color: inColor).copyWith(
              borderRadius: onlyTopRadius
                  ? BorderRadius.vertical(
                      top: cirRadius,
                    )
                  : BorderRadius.all(cirRadius),
              border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(
                  colors: hovered
                      ? [k7Gradient, borderColor, k7Gradient]
                      : [borderColor, k7Gradient, borderColor],
                ),
              ),
            ),
            // BoxDecoration(
            //   color: inColor,

            // ),
            child: child,
          ),
        ),
      ),
    );
  }
}
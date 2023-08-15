import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/router/hero_page_route.dart';
import 'package:nemr_portfolio/config/colors.dart';

/// A page to enable hero animation with slide from bottom animation and backdrop filter
class HeroPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String barrierLabel;
  final bool semanticsDismissible;
  final WidgetBuilder builder;
  final ImageFilter? filter;

  const HeroPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = kContainerColor,
    this.barrierDismissible = true,
    this.barrierLabel = "Dismiss",
    this.semanticsDismissible = true,
    this.filter,
    super.key,
  });

  @override
  Route<T> createRoute(BuildContext context) => HeroPageRoute<T>(
        builder: builder,
        barrierDismissible: barrierDismissible,
        // anchorPoint: anchorPoint,
        barrierLabel: barrierLabel,
        // barrierColor: barrierColor,
        filter: filter,
        semanticsDismissible: semanticsDismissible,
        settings: this,
      );
}

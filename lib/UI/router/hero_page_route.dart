import 'dart:ui';

import 'package:flutter/cupertino.dart';

/// Hero Page Route with slide transition from bottom and backdrop filter
class HeroPageRoute<T> extends PageRoute<T> {
  @override
  final String? barrierLabel;
  final WidgetBuilder builder;
  // ignore: annotate_overrides , overridden_fields
  final ImageFilter? filter;

  HeroPageRoute({
    this.filter,
    required this.builder,
    this.barrierLabel = 'Dismiss',
    bool barrierDismissible = true,
    bool semanticsDismissible = false,
    super.settings,
  });
  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => kCupertinoModalBarrierColor;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return BackdropFilter(
        filter: filter ?? ImageFilter.blur(), child: builder(context));
  }
}

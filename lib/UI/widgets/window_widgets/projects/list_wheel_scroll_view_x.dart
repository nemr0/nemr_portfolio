import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// ListWheelScrollViewX is modified version of ListWheelScrollView but having
/// scrollDirection arg. It used RotatedBox on ListWheelScrollView to accomplish
/// this.

class ListWheelScrollViewX extends StatelessWidget {
  const ListWheelScrollViewX({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    this.offAxisFraction = 0.0,
    this.useMagnifier = false,
    this.magnification = 1.0,
    this.overAndUnderCenterOpacity = 1.0,
    required this.itemExtent,
    this.squeeze = 1.0,
    this.onSelectedItemChanged,
    this.renderChildrenOutsideViewport = false,
    this.clipBehavior = Clip.hardEdge,
    required this.children,
    this.scrollBehavior,
  }) : childDelegate = null;

  const ListWheelScrollViewX.useDelegate({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.controller,
    this.physics,
    this.diameterRatio = RenderListWheelViewport.defaultDiameterRatio,
    this.perspective = RenderListWheelViewport.defaultPerspective,
    this.offAxisFraction = 0.0,
    this.useMagnifier = false,
    this.magnification = 1.0,
    this.overAndUnderCenterOpacity = 1.0,
    required this.itemExtent,
    this.squeeze = 1.0,
    this.onSelectedItemChanged,
    this.renderChildrenOutsideViewport = false,
    this.clipBehavior = Clip.hardEdge,
    required this.childDelegate,
    this.scrollBehavior,
  }) : children = null;

  /// Direction of the ListWheelScrollViewX
  final Axis scrollDirection;

  final List<Widget>? children;

  /// Typically a [FixedExtentScrollController] used to control the current item.
  ///
  /// A [FixedExtentScrollController] can be used to read the currently
  /// selected/centered child item and can be used to change the current item.
  ///
  /// If none is provided, a new [FixedExtentScrollController] is implicitly
  /// created.
  ///
  /// If a [ScrollController] is used instead of [FixedExtentScrollController],
  /// [ScrollNotification.metrics] will no longer provide [FixedExtentMetrics]
  /// to indicate the current item index and [onSelectedItemChanged] will not
  /// work.
  ///
  /// To read the current selected item only when the value changes, use
  /// [onSelectedItemChanged].
  final ScrollController? controller;

  /// How the scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to animate after the
  /// user stops dragging the scroll view.
  ///
  /// Defaults to matching platform conventions.
  final ScrollPhysics? physics;

  /// {@macro flutter.rendering.wheelList.diameterRatio}
  final double diameterRatio;

  /// {@macro flutter.rendering.wheelList.perspective}
  final double perspective;

  /// {@macro flutter.rendering.wheelList.offAxisFraction}
  final double offAxisFraction;

  /// {@macro flutter.rendering.wheelList.useMagnifier}
  final bool useMagnifier;

  /// {@macro flutter.rendering.wheelList.magnification}
  final double magnification;

  /// {@macro flutter.rendering.wheelList.overAndUnderCenterOpacity}
  final double overAndUnderCenterOpacity;

  /// Size of each child in the main axis. Must not be null and must be
  /// positive.
  final double itemExtent;

  /// {@macro flutter.rendering.wheelList.squeeze}
  ///
  /// Defaults to 1.
  final double squeeze;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<int>? onSelectedItemChanged;

  /// {@macro flutter.rendering.wheelList.renderChildrenOutsideViewport}
  final bool renderChildrenOutsideViewport;

  /// A delegate that helps lazily instantiating child.
  final ListWheelChildDelegate? childDelegate;

  /// {@macro flutter.widgets.Clip}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// A ScrollBehavior that will be applied to this widget individually.
  /// Defaults to null, wherein the inherited ScrollBehavior is copied and modified to alter the viewport decoration, like Scrollbars.
  /// ScrollBehaviors also provide ScrollPhysics. If an explicit ScrollPhysics is provided in physics, it will take precedence, followed by scrollBehavior, and then the inherited ancestor ScrollBehavior.
  /// The ScrollBehavior of the inherited ScrollConfiguration will be modified by default to not apply a Scrollbar.
  final ScrollBehavior? scrollBehavior;

  @override
  Widget build(BuildContext context) {
    int quarterTurns = scrollDirection == Axis.horizontal ? 1 : 0;
    final ListWheelChildDelegate childDelegate0 = children != null
        ? ListWheelChildListDelegate(
            children: children!.map((Widget child) {
              return RotatedBox(
                quarterTurns: quarterTurns,
                child: child,
              );
            }).toList(),
          )
        : ListWheelChildBuilderDelegate(
            builder: (BuildContext context, int index) {
              return RotatedBox(
                quarterTurns: quarterTurns,
                child: childDelegate!.build(context, index),
              );
            },
          );

    return RotatedBox(
      quarterTurns: scrollDirection == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: diameterRatio,
        perspective: perspective,
        offAxisFraction: offAxisFraction,
        useMagnifier: useMagnifier,
        magnification: magnification,
        overAndUnderCenterOpacity: overAndUnderCenterOpacity,
        itemExtent: itemExtent,
        squeeze: squeeze,
        onSelectedItemChanged: onSelectedItemChanged,
        renderChildrenOutsideViewport: renderChildrenOutsideViewport,
        clipBehavior: clipBehavior,
        childDelegate: childDelegate0,
        scrollBehavior: scrollBehavior,
      ),
    );
  }
}

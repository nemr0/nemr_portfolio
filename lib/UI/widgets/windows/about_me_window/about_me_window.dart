import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seo/html/seo_widget.dart';

import '../../../../config/text_styles.dart';
import '../../../providers/is_minimized_providers.dart';
import '../../custom_paint/name_painter.dart';
import '../window.dart';
import 'avatar_icon.dart';
import 'link_button.dart';

/// About Me Window with my avatar and links
class AboutMeWindow extends HookConsumerWidget {
  // final double height;
  // final double width;
  // final void Function(bool val)? onMinimized;

  const AboutMeWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    /// width used to render animation of gradient container
    final uWidth = MediaQuery.of(context).orientation == Orientation.landscape
        ? width * .3
        : width * .6;

    final animationCTR = useAnimationController(
        duration: const Duration(seconds: 1),
        upperBound: uWidth * .035,
        animationBehavior: AnimationBehavior.preserve);
    useEffect(() {
      animationCTR.forward();
      animationCTR.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationCTR.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationCTR.forward();
        }
      });
      return null;
    }, []);
    final isMinimized = ref.watch(isAvatarMinimizedProvider);
    List<Widget> title = [
      const Flexible(
        child: FittedBox(
          child: Text.rich(
            TextSpan(style: kTSTitle, text: 'Omar Elnemr', children: [
              TextSpan(text: '\nmobile apps dev', style: kTSSubName)
            ]),
            textAlign: TextAlign.end,
          ),
        ),
      ),
      Flexible(
        child: AnimatedBuilder(
          animation: animationCTR,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              size: Size(uWidth * .04,
                  (animationCTR.value * 3.2142857142857144).toDouble()),
              painter: GradientContainerPaint(),
            );
          },
        ),
      ),
    ];
    return Window(
      isMin: isAvatarMinimizedProvider,
      child: Seo.text(
        text: 'Omar Elnemr Mobile App Developer Flutter Developer',
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isMinimized
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Flexible(
                        child: AvatarIcon(),
                      ),
                      ...title
                    ],
                  )
                : Wrap(
                    direction: isMinimized ? Axis.vertical : Axis.horizontal,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.center,
                    children: [
                      const AvatarIcon(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: title,
                      ),
                      for (LinkButtonConfig config in configs)
                        LinkButton(config: config)
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

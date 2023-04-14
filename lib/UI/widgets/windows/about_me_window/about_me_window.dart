import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helpers/get_orientation.dart';
import 'package:seo/seo.dart';

import '../../../../config/link_button_configs.dart';
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
    final uWidth = getOrientation(context) == Orientation.landscape
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
    final isMinimized = ref.watch(isAboutMeMinimizedProvider);
    final scrollCTR = useScrollController();

    return Window(
      iAdded: true,
      isMinProvider: isAboutMeMinimizedProvider,
      child: Seo.text(
        text: 'Omar Elnemr Mobile App Developer Flutter Developer',
        style: TextTagStyle.h1,
        child: CupertinoScrollbar(
          thumbVisibility: true,
          controller: scrollCTR,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: scrollCTR,
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      direction:
                          getOrientation(context) == Orientation.landscape
                              ? Axis.vertical
                              : Axis.horizontal,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        const AvatarIcon(),
                        IntrinsicHeight(
                          child: Column(
                            children: [
                              IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Flexible(
                                      flex: 6,
                                      child: FittedBox(
                                        child: Text.rich(
                                          TextSpan(
                                              style: kTSTitle,
                                              text: 'Omar Elnemr',
                                              children: [
                                                TextSpan(
                                                    text: '\nmobile apps dev',
                                                    style: kTSSubName)
                                              ]),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: AnimatedBuilder(
                                        animation: animationCTR,
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return CustomPaint(
                                            size: Size(
                                                8,
                                                (animationCTR.value *
                                                        3.2142857142857144)
                                                    .toDouble()),
                                            painter: GradientContainerPaint(),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isMinimized == false)
                                IntrinsicWidth(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (LinkButtonConfig config in configs)
                                        Flexible(
                                            child: FittedBox(
                                                child:
                                                    LinkButton(config: config)))
                                    ],
                                  ),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

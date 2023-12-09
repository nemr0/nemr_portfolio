import 'package:flutter/cupertino.dart' show CupertinoColors, CupertinoScrollbar;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/helper/hooks/precache_image_hook.dart';
import 'package:nemr_portfolio/UI/helper/is_mobile.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/link_button.dart';
import 'package:nemr_portfolio/UI/widgets/image_error_widget.dart';
import 'package:nemr_portfolio/UI/widgets/provider/scroll_on_top_provider.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../config/consts.dart';
import '../../../../model/link_button_config.dart';

class ProjectView extends HookConsumerWidget {
  const ProjectView({
    Key? key,
    required this.config,
    required this.currentIndex,
  }) : super(key: key);
  final ProjectConfig config;
  final int currentIndex;
  scrollAndPop(ScrollController scrollCTR,BuildContext context){
    scrollCTR.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.bounceInOut);
    Future.delayed(Duration(milliseconds: 300),() =>context.canPop()?context.pop():null);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();
    final topScroll = ref.watch(scrollOnTopProvider);
    final scrollCTR = useScrollController();

    useEffect(() {

      if (currentIndex == config.index)
        GetStorage().write(UsedStrings.projectIndexKey, config.index);
      return null;
    }, [currentIndex]);

    final Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: usePrecacheFadeInImage(FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: config.url,
          fit: BoxFit.cover,
          imageErrorBuilder: (ctx, _, __) => const ImageErrorWidget())),
    );


    final Widget icons = Padding(
      padding: const EdgeInsets.all(15.0),
      child: Wrap(
        verticalDirection: VerticalDirection.down,
        children: [
          for (LinkButtonConfig buttonConfig in (config.icons)!)
            LinkButton(config: buttonConfig),
        ],
      ),
    );

    final Widget desc = Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          config.desc,
          style: kTSBody,
          textAlign: TextAlign.start,
        ),
      ),
    );

    return GestureDetector(
      onVerticalDragUpdate: (details) async {
        // int sensitivity = 10;
        if (details.delta.dy > 8) {
          scrollAndPop(scrollCTR, context);
        }
      },
      child: Window(
        radius: topScroll ? 40 : 0,
        inColor: kAltContainerColor,
        height: context.height,
        padding: topScroll
            ? EdgeInsets.only(
                left: context.width * .02,
                right: context.width * .02,
                // top: context.height * (1/11),
              )
            : EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: kYellowColor,
                        ),
                        onPressed: () =>scrollAndPop(scrollCTR, context),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Swipe Down to Close',
                    style: kSwipeText,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollNotification) {
                  final current = scrollNotification.metrics.pixels;
                  // final max=scrollNotification.metrics.maxScrollExtent;
                  final min = scrollNotification.metrics.minScrollExtent;
                  if (current != min
                      // && isMobile
                  ) {
                    ref.read(scrollOnTopProvider.notifier).state = false;
                  } else {
                    ref.read(scrollOnTopProvider.notifier).state = true;
                  }
                  return false;
                },
                child: CupertinoScrollbar(
                  thumbVisibility: true,
                  controller: scrollCTR,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: ListView(
                          controller: scrollCTR,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: FittedBox(
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          'PROJECT:${context.orientation == Orientation.portrait ? '\n' : ' '}',
                                      style: kTSBoldTitle.copyWith(
                                          color: kPrimaryColor),
                                      children: [
                                        TextSpan(
                                          text:
                                              '${config.name.toUpperCase()}\n',
                                          style: const TextStyle(
                                            color: CupertinoColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                            if (context.orientation ==
                                Orientation.landscape) ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [desc, icons],
                                    ),
                                  ),
                                  Expanded(child: image),
                                ],
                              ),
                            ],
                            if (context.orientation ==
                                Orientation.portrait) ...[
                              image,
                              if (config.icons != null) icons,
                              desc,
                            ],
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart'
    show CupertinoColors, CupertinoScrollbar, CupertinoTheme;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/helper/hooks/precache_image_hook.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/link_button.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../model/link_button_config.dart';

class ProjectView extends HookWidget {
  const ProjectView({Key? key, required this.config}) : super(key: key);
  final ProjectConfig config;

  @override
  Widget build(BuildContext context) {
    final scrollCTR = useScrollController();
    final Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: usePrecacheFadeInImage(FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: config.url,
          fit: BoxFit.cover,
          imageErrorBuilder: (ctx, _, __) => Text(
                'Could Not Load Image',
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      color: Theme.of(ctx).colorScheme.error,
                    ),
              ))),
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

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.down,
      onDismissed: (d) => context.go('/'),
      child: Window(
        radius: 40,
        inColor: kAltContainerColor,
        height: context.height * .98,
        duration: const Duration(milliseconds: 10),
        padding: EdgeInsets.only(
          left: context.width * .02,
          right: context.width * .02,
          top: context.height * .02,
        ),
        child: CupertinoScrollbar(
          controller: scrollCTR,
          thumbVisibility: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                controller: scrollCTR,
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Center(
                    child: Text(
                      'Swipe Down to Close',
                      style: kSwipeText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: kYellowColor,
                        ),
                        onPressed: () => context.go('/'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: FittedBox(
                        child: Text.rich(
                          TextSpan(
                            text:
                                'PROJECT:${context.orientation == Orientation.portrait ? '\n' : ' '}',
                            style: kTSBoldTitle.copyWith(color: kPrimaryColor),
                            children: [
                              TextSpan(
                                text: '${config.name.toUpperCase()}\n',
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
                  if (context.orientation == Orientation.landscape) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [desc, icons],
                          ),
                        ),
                        Expanded(child: image),
                      ],
                    ),
                  ],
                  if (context.orientation == Orientation.portrait) ...[
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
    );
  }
}

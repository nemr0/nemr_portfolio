import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show IconButton, Theme;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/link_button.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';

import '../../../../model/link_button_config.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key, required this.config}) : super(key: key);
  final ProjectConfig config;

  @override
  Widget build(BuildContext context) {
    final Widget image = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FastCachedImage(
          url: config.url,
          fit: BoxFit.cover,
          loadingBuilder: (ctx, progress) => const Center(
            child: CupertinoActivityIndicator(
              radius: 15,
            ),
          ),
          errorBuilder: (ctx, _, __) => Text(
            'Could Not Load Image',
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  color: Theme.of(ctx).colorScheme.error,
                ),
          ),
        ),
      ),
    );
    final Widget icons = Wrap(
      verticalDirection: VerticalDirection.down,
      children: [
        for (LinkButtonConfig buttonConfig in (config.icons)!)
          LinkButton(config: buttonConfig),
      ],
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

    return Window(
      aboutEnabled: false,
      radius: 40,
      inColor: kAltContainerColor,
      duration: Duration.zero,
      padding: EdgeInsets.only(
        left: context.width * .02,
        right: context.width * .02,
        top: context.height * .02,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text.rich(
                        TextSpan(
                          text:
                              'PROJECT:${context.orientation == Orientation.portrait ? '\n' : ' '}',
                          style: kTSBoldTitle.copyWith(color: kPrimaryColor),
                          children: [
                            TextSpan(
                              text: config.name.toUpperCase(),
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
                  Expanded(
                    flex: 4,
                    child: image,
                  ),
                  if (config.icons != null)
                    Expanded(
                      child: icons,
                    ),
                  Expanded(
                    flex: 4,
                    child: desc,
                  ),
                ],
                const Spacer(),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const FaIcon(
                FontAwesomeIcons.solidCircleXmark,
                color: kYellowColor,
              ),
              onPressed: () => context.go('/'),
            ),
          ),
        ],
      ),
    );
  }
}

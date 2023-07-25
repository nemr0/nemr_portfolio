import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show IconButton, Theme;
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
    final Widget image = ClipRRect(
      borderRadius: BorderRadius.circular(40),
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
      radius: 40,
      inColor: kAltContainerColor,
      duration: const Duration(milliseconds: 10),
      padding: EdgeInsets.only(
        left: context.width * .02,
        right: context.width * .02,
        top: context.height * .02,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.solidCircleXmark,
                  color: kYellowColor,
                ),
                onPressed: () => context.go('/'),
              ),
            ),
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
      // Positioned(
      //   top: 10,
      //   left: 10,
      //   child: IconButton(
      //     icon: const FaIcon(
      //       FontAwesomeIcons.solidCircleXmark,
      //       color: kYellowColor,
      //     ),
      //     onPressed: () => context.go('/'),
      //   ),
      // ),
    );
  }
}

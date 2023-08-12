import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../model/link_button_config.dart';
import '../../../helper/hooks/precache_image_hook.dart';
import '../../buttons/link_button.dart';
import '../../glass_morphism.dart';

class ProjectWidget extends HookWidget {
  const ProjectWidget({
    Key? key,
    this.clickable = false,
    required this.config,
    this.last = false,
  }) : super(key: key);
  final bool clickable;
  final ProjectConfig config;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: clickable ? 1 : .5,
      child: Transform.scale(
        scale: clickable ? 1 : 0.9,
        child: last
            ? InkWell(
                mouseCursor: !clickable
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.click,
                onTap: clickable
                    ? () => onLinkLaunch(kGithubLinkButtonConfig.link!)
                    : null,
                child: GradientBorderGlassBox(
                  radius: 10,
                  height: 300,
                  width: context.width,
                  inColor: kAltContainerColor,
                  onlyTopRadius: false,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'More?',
                        style: kTSTitle,
                      ),
                      LinkButton(config: kGithubLinkButtonConfig),
                    ],
                  ),
                ),
              )
            : InkWell(
                mouseCursor: !clickable
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.click,
                onTap: clickable
                    ? () {
                        context.goNamed(
                          config.id,
                          // queryParameters: {}
                        );
                      }
                    : null,
                child: Stack(
                  children: [
                    GradientBorderGlassBox(
                        radius: 10,
                        height: 300,
                        width: context.width,
                        inColor: kAltContainerColor,
                        onlyTopRadius: false,
                        child: usePrecacheFadeInImage(FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: config.url,
                            fit: BoxFit.cover,
                            imageErrorBuilder: (ctx, _, __) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.triangleExclamation,
                                      size: 30,
                                      color: Theme.of(ctx)
                                          .colorScheme
                                          .errorContainer,
                                    ),
                                    Text(
                                      'Could Not Load Image',
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .textStyle
                                          .copyWith(
                                            color:
                                                Theme.of(ctx).colorScheme.error,
                                          ),
                                    ),
                                  ],
                                )))),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GlassMorphism(
                        width: context.width,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(10),
                        ),
                        color: CupertinoColors.black.withOpacity(.7),
                        child: Text(
                          config.name,
                          style: kTSBody,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

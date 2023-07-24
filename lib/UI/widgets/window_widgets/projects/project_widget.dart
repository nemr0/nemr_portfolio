import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';

import '../../../../model/link_button_config.dart';
import '../../buttons/link_button.dart';
import '../../glass_morphism.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key? key, required this.config, this.last = false})
      : super(key: key);
  final ProjectConfig config;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return last
        ? GradientBorderGlassBox(
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
          )
        : InkWell(
            mouseCursor: SystemMouseCursors.click,
            onTap: () {
              context.goNamed(config.id);
            },
            child: Stack(
              children: [
                GradientBorderGlassBox(
                  radius: 10,
                  height: 300,
                  width: context.width,
                  inColor: kAltContainerColor,
                  onlyTopRadius: false,
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
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(
                            color: Theme.of(ctx).colorScheme.error,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GlassMorphism(
                    width: context.width,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10)),
                    color: CupertinoColors.black.withOpacity(.7),
                    child: Text(
                      config.name,
                      style: kTSBody,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

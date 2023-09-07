import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../model/link_button_config.dart';
import '../../buttons/link_button.dart';
import '../../glass_morphism.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    required this.length,
    Key? key,
    required this.config,
    this.last = false,
  }) : super(key: key);
  final double length;
  final ProjectConfig config;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: length,
      width: length,
      child: GradientBorderGlassBox(
        onTap: () {
          context.goNamed(
            config.id,
            // queryParameters: {}
          );
        },
        radius: 10,
        height: length,
        width: length,
        inColor: kAltContainerColor,
        onlyTopRadius: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Hero(
                transitionOnUserGestures: true,
                tag: config.id,
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: config.url,
                    fit: BoxFit.cover,
                    width: length,
                    imageErrorBuilder: (ctx, _, __) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Spacer(),
                              Expanded(
                                child: FaIcon(
                                  FontAwesomeIcons.triangleExclamation,
                                  size: 30,
                                  color: kYellowColor,
                                ),
                              ),
                              Expanded(
                                child: FittedBox(
                                  child: Text(
                                    'Could Not Load Image',
                                    style: CupertinoTheme.of(context)
                                        .textTheme
                                        .textStyle
                                        .copyWith(color: kGradientColor),
                                  ),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )),
              ),
            ),
            GlassMorphism(
              width: length,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              color: CupertinoColors.black.withOpacity(.7),
              child: Text(
                config.name,
                style: kTSBody,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GithubProjectWidget extends StatelessWidget {
  const GithubProjectWidget({
    super.key,
    required this.length,
  });

  final double length;

  @override
  Widget build(BuildContext context) {
    return GradientBorderGlassBox(
      onTap: () => onLinkLaunch(kGithubLinkButtonConfig.link!),
      radius: 10,
      height: length,
      width: length,
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
    );
  }
}

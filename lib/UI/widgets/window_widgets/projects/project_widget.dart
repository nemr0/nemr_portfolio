import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helper/hooks/precache_image_hook.dart';
import 'package:nemr_portfolio/UI/widgets/image_error_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/project_config.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../model/link_button_config.dart';
import '../../buttons/link_button.dart';
import '../../glass_morphism.dart';

class ProjectWidget extends ConsumerWidget {
  const ProjectWidget({
    required this.length,
    Key? key,
    required this.config,
    required this.current,
    required this.last,
  }) : super(key: key);
  final double length;
  final ProjectConfig config;
  final bool current;
  final bool last;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AnimatedScale(
      scale: current ? 1 : .8,
      duration: Duration(milliseconds: 50),
      child: SizedBox(
        height: length,
        width: length,
        child: last
            ? GithubProjectWidget(length: length)
            : GradientBorderGlassBox(
                onTap: () {
                  // cachedIndexProvider.setState(ref,config.index);
                  context.goNamed(
                    config.id,
                        pathParameters: {'id':config.id}
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
                      child: PrecachedImageWidget(url: config.url, length: length, ),
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class PrecachedImageWidget extends StatelessWidget {
  const PrecachedImageWidget({
    super.key,
    required this.url,
    required this.length,

  });
  final String url;
  final double length;

  @override
  Widget build(BuildContext context) {
    return HookBuilder(
      builder: (context) => usePrecacheFadeInImage(
        FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: url,
            fit: BoxFit.cover,
            width: length,
            imageErrorBuilder: (ctx, _, __) =>const ImageErrorWidget()),
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

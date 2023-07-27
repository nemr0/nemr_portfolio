import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Tooltip;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/UI/helper/hooks/precache_image_hook.dart';
import 'package:nemr_portfolio/UI/helper/is_mobile.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:seo/html/seo_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../../../model/link_button_config.dart';

onLinkLaunch(
  String link,
  // {bool newPage = true,}
) async {
  html.window.open(
    link,
    '_self',
  );
}

class LinkButton extends HookWidget {
  const LinkButton({super.key, required this.config});

  final LinkButtonConfig config;

  @override
  Widget build(BuildContext context) {
    final Decoration decoration = glassBoxDecoration(
      color: config.asset == null ? kContainerColor : config.color,
    );
    final onHoverSize = useState(20.0);
    final image = config.asset == null
        ? GlassMorphism(
            height: onHoverSize.value + 10,
            width: onHoverSize.value + 10,
            color: kContainerColor,
            child: Center(
              child: FaIcon(
                config.icon,
                color: CupertinoColors.white,
                size: onHoverSize.value,
              ),
            ),
          )
        : GlassMorphism(
            height: onHoverSize.value + 10,
            width: onHoverSize.value + 10,
            color: config.color,
            borderRadius: BorderRadius.circular(3),
            child: usePrecacheImage(Image.asset(
              config.asset!,
              fit: BoxFit.contain,
            )),
          );

    return Seo.link(
      href: config.link ?? '',
      anchor: config.name,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (s) => !isMobile ? onHoverSize.value = 30 : null,
        onExit: (s) => onHoverSize.value = 20,
        child: Tooltip(
          message: config.toolTipOn ? config.name : '',
          decoration: config.toolTipOn
              ? decoration
              : const BoxDecoration(color: Color(0x00000000)),
          textStyle: kTSAgreement,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed:
                config.link == null ? null : () => onLinkLaunch((config.link)!),
            child: image,
          ),
        ),
      ),
    );
  }
}

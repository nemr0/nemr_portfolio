import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/helpers/is_mobile.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/link_button_configs.dart';

onLinkLaunch(String link) async => await canLaunchUrl(Uri.parse(link))
    ? launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication)
    : null;

class LinkButton extends HookWidget {
  const LinkButton({super.key, required this.config});

  final LinkButtonConfig config;

  @override
  Widget build(BuildContext context) {
    final Decoration decoration = glassBoxDecoration(color: config.color);
    final onHoverSize = useState(30.0);
    return Seo.link(
      href: config.link ?? '',
      anchor: config.asset,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (s) => !isMobile ? onHoverSize.value = 35 : null,
        onExit: (s) => onHoverSize.value = 30,
        child: Tooltip(
          message: config.toolTipOn ? config.asset : '',
          decoration: config.toolTipOn
              ? decoration
              : const BoxDecoration(color: Color(0x00000000)),
          textStyle: kTSAgreement,
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: config.link == null
                  ? null
                  : () => onLinkLaunch((config.link)!),
              child: GlassMorphism(
                height: onHoverSize.value,
                width: onHoverSize.value,
                color: config.color,
                child: Image.asset(
                  'icons/${config.asset}.png',
                  height: onHoverSize.value - 8,
                  width: onHoverSize.value - 8,
                  fit: BoxFit.contain,
                ),
              )),
        ),
      ),
    );
  }
}

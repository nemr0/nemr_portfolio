import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/helpers/is_mobile.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/text.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

const List<LinkButtonConfig> configs = [
  LinkButtonConfig(asset: kAGithub, link: kURLGithub, color: kCGithub),
  LinkButtonConfig(asset: kALinkedIn, link: kURLLinkedIn, color: kCLinkedIn),
  LinkButtonConfig(asset: kATiktok, link: kURLTiktok, color: kCTiktok),
  LinkButtonConfig(asset: kAig, link: kURLig, color: kCIG),
  LinkButtonConfig(asset: kAcv, link: kURLcv, color: kCCV),
  LinkButtonConfig(asset: kADribble, link: kURLDribble, color: kCDribble),
];

class LinkButtonConfig {
  const LinkButtonConfig({
    required this.asset,
    required this.link,
    required this.color,
  });
  final String asset;
  final String link;
  final Color color;
}

class LinkButton extends HookWidget {
  const LinkButton({super.key, required this.config});

  final LinkButtonConfig config;

  @override
  Widget build(BuildContext context) {
    final Decoration decoration = glassBoxDecoration(color: config.color);
    final onHoverSize = useState(30.0);
    return Seo.link(
      href: config.link,
      anchor: config.asset,
      child: MouseRegion(
        onEnter: (s) => !isMobile ? onHoverSize.value = 35 : null,
        onExit: (s) => onHoverSize.value = 30,
        child: Tooltip(
          message: config.asset,
          decoration: decoration,
          textStyle: kTSAgreement,
          child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () async => await canLaunchUrl(Uri.parse(config.link))
                  ? launchUrl(Uri.parse(config.link),
                      mode: LaunchMode.externalApplication)
                  : null,
              child: GlassMorphism(
                height: onHoverSize.value,
                width: onHoverSize.value,
                color: config.color,
                decoration: decoration,
                child: Image.asset(
                  'assets/${config.asset}.png',
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

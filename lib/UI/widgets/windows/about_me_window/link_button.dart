import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/config/text.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

List<LinkButtonConfig> configs = [
  LinkButtonConfig(asset: kAGithub, link: kURLGithub),
  LinkButtonConfig(asset: kALinkedIn, link: kURLLinkedIn),
  LinkButtonConfig(asset: kATiktok, link: kURLTiktok),
  LinkButtonConfig(asset: kAig, link: kURLig),
  LinkButtonConfig(asset: kAcv, link: kURLcv),
  LinkButtonConfig(asset: kADribble, link: kURLDribble),
];

class LinkButtonConfig {
  LinkButtonConfig({
    required this.asset,
    required this.link,
  });
  final String asset;
  final String link;
}

class LinkButton extends HookWidget {
  const LinkButton({super.key, required this.config});

  final LinkButtonConfig config;

  @override
  Widget build(BuildContext context) {
    final onHoverSize = useState(20.0);
    return Seo.link(
      href: config.link,
      anchor: config.asset,
      child: MouseRegion(
        onHover: (s) => onHoverSize.value = 25,
        onExit: (s) => onHoverSize.value = 20,
        child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async => await canLaunchUrl(Uri.parse(config.link))
                ? launchUrl(Uri.parse(config.link),
                    mode: LaunchMode.externalApplication)
                : null,
            child: Container(
              height: onHoverSize.value,
              width: onHoverSize.value,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        'assets/${config.asset}.png',
                      ))),
            )),
      ),
    );
  }
}

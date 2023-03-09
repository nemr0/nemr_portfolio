import 'package:flutter/cupertino.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../style/constants/text.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        LinkButton(
          asset: kAGithub,
          link: kURLGithub,
        ),
        LinkButton(
          asset: kALinkedIn,
          link: kURLLinkedIn,
        ),
        LinkButton(
          asset: kATiktok,
          link: kURLTiktok,
        ),
        LinkButton(
          asset: kAig,
          link: kURLig,
        ),
        LinkButton(
          asset: kAcv,
          link: kURLcv,
        ),
        LinkButton(
          asset: kADribble,
          link: kURLDribble,
        ),
      ],
    );
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.asset,
    required this.link,
  });

  final String asset;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Seo.link(
      href: link,
      anchor: asset,
      child: CupertinoButton(
          onPressed: () => launchUrl(Uri.parse(link)),
          child: Image.asset(
            'assets/$asset.png',
            fit: BoxFit.contain,
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final orientation = MediaQuery.of(context).orientation;
    return Seo.link(
      href: link,
      anchor: asset,
      child: CupertinoButton(
          padding: EdgeInsets.all(orientation == Orientation.portrait ? 5 : 10),
          onPressed: () => launchUrl(Uri.parse(link)),
          child: Image.asset(
            'assets/$asset.png',
            fit: BoxFit.contain,
          )),
    );
  }
}

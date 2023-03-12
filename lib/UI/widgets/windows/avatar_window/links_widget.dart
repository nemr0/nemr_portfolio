import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/style/constants/text.dart';
import 'link_button.dart';

/// All links I have in a [Wrap] Widget
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

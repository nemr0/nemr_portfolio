import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/text_by_icon_button.dart';
import 'package:nemr_portfolio/config/link_button_config.dart';
import 'package:nemr_portfolio/config/text_styles.dart';

import '../windows/about_me_window/link_button.dart';

class AboutMeDialog extends StatelessWidget {
  const AboutMeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('About'),
      content: Column(
        children: [
          const TextByIconButton(
            noSpace: true,
            text: 'Built With',
            textDirection: TextDirection.rtl,
            config: kHeartLinkButtonConfig,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'Thanks to',
            style: kTSAgreement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Wrap(
            children: [
              for (LinkButtonConfig config in aboutConfigs)
                LinkButton(config: config),
            ],
          ),
          const Text(
            'Also, all of Flutter Community Contributions, I hope I\'m not forgetting anyone :\'',
            style: kTSAgreement,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}

List<LinkButtonConfig> aboutConfigs = [
  kFlutterLinkButtonConfig,
  kRiveLinkButtonConfig,
  kFRiverpodLinkButtonConfig,
  kFHooksLinkButtonConfig,
  kEmailJSLinkButtonConfig,
  kGithubLinkButtonConfig,
  kVercelLinkButtonConfig,
];

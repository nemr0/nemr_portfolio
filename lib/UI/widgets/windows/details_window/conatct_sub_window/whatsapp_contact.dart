import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/config/text.dart';

import '../../../../../config/text_styles.dart';
import '../../about_me_window/link_button.dart';

class WhatsappContactWidget extends StatelessWidget {
  const WhatsappContactWidget(
      {Key? key,
      this.text = 'Need to hire me ASAP? Let\'s Chat On WhatsApp!',
      this.mainAxisAlignment = MainAxisAlignment.start})
      : super(key: key);
  final String text;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const LinkButton(
            config: LinkButtonConfig(
                asset: kAWhatsapp, link: kURLWhatsapp, color: kCWhatsapp)),
        const SizedBox(
          width: 2,
        ),
        Expanded(
          child: Text(
            text,
            style: kTSAgreement,
          ),
        )
      ],
    );
  }
}

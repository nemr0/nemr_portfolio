import 'package:flutter/cupertino.dart';

import '../../../../../config/text_styles.dart';
import '../../about_me_window/link_button.dart';

class WhatsappContactWidget extends StatelessWidget {
  const WhatsappContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LinkButton(
            config: LinkButtonConfig(
          asset: 'whatsapp',
          link:
              "https://wa.me/201147898061?text=Hey%20Omar,%20%0AI%20need%20your%20help%20ASAP%20with%20this:",
        )),
        const SizedBox(
          width: 2,
        ),
        const Text(
          'Need to hire me ASAP? Let\'s Chat On WhatsApp!',
          style: kTSAgreement,
        )
      ],
    );
  }
}

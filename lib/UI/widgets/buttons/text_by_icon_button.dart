import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/link_button_configs.dart';

import '../../../config/text_styles.dart';
import '../windows/about_me_window/link_button.dart';

/// Originally was WhatsappContactWidget as text beside a whatsapp icon button
/// now it defaults to whatsapp icon with button
class TextByIconButtonWidget extends StatelessWidget {
  const TextByIconButtonWidget(
      {Key? key,
      this.text = 'Need to hire me ASAP? Let\'s Chat On WhatsApp!',
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.config,
      this.noSpace = false,
      this.textDirection})
      : super(key: key);
  final String text;
  final MainAxisAlignment mainAxisAlignment;
  final LinkButtonConfig? config;
  final TextDirection? textDirection;
  final bool noSpace;
  @override
  Widget build(BuildContext context) {
    final Row row = Row(
      textDirection: textDirection,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        LinkButton(config: config ?? kWhatsappLinkButtonConfig),
        if (noSpace == false)
          const SizedBox(
            width: 2,
          ),
        Expanded(
          child: SelectableText(
            text,
            style: kTSAgreement,
          ),
        ),
      ],
    );
    return noSpace
        ? GlassMorphism(
            height: 50,
            width: 125,
            color: CupertinoColors.white.withOpacity(.35),
            child: row)
        : row;
  }
}

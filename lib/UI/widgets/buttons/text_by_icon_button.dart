import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/model/link_button_config.dart';

import '../../../config/text_styles.dart';
import 'link_button.dart';

/// Originally was WhatsappContactWidget as text beside a whatsapp icon button
/// now it defaults to whatsapp icon with button
class TextByIconButton extends StatelessWidget {
  const TextByIconButton({
    Key? key,
    this.text = 'Need to hire me ASAP? Let\'s Chat On WhatsApp!',
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.config,
    this.noSpace = false,
    this.textDirection,
  }) : super(key: key);
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
        if (!noSpace)
          const SizedBox(
            width: 2,
          ),
        Expanded(
          child: Text(
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
            child: row,
          )
        : row;
  }
}

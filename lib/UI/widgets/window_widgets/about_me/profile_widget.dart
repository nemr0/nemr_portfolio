import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/title_widget.dart';

import '../../../../config/text_styles.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
          icon: FontAwesomeIcons.solidHeart,
          iconColor: CupertinoColors.systemRed,
          style: kTSBoldBody,
          text: 'HELLO THERE',
          iconLeftAligned: false,
          iconSize: 20,
          spaceBetween: 10,
        ),
        Text.rich(
          TextSpan(text: '\n', children: [
            // TextSpan(text: '', style: kTSBoldBody),
            TextSpan(text: 'I\'m Omar Elnemr, A '),
            TextSpan(text: 'Mobile Application Developer ', style: kTSBoldBody),
            TextSpan(text: 'specialized in '),
            TextSpan(text: 'Flutter, ', style: kTSBoldBody),
            TextSpan(text: 'I\'m an expert in bringing challenging '),
            TextSpan(text: 'Ui/Ux Designs, ', style: kTSBoldBody),
            TextSpan(text: 'to life.'),
          ]),
          style: kTSBody,
          maxLines: 12,
          // minLines: 8,
        ),
      ],
    );
  }
}

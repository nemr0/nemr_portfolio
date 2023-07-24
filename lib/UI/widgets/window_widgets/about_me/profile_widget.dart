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
    return const Column(
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

            // TextSpan(
            //   text: 'Ardent',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text:
            //       ' and skilled Software Developer specializing in mobile app development using ',
            // ),
            // TextSpan(
            //   text: 'Flutter',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: ' and ',
            // ),
            // TextSpan(
            //   text: ' Dart. ',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text:
            //       'Utilizing it in delivering seamless user experiences and optimized app performance. ',
            // ),
            // TextSpan(
            //   text: 'Experienced ',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: 'in ',
            // ),
            // TextSpan(
            //   text: 'UI/UX Design',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: 'and ',
            // ),
            // TextSpan(
            //   text: 'proficient',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: 'in ',
            // ),
            // TextSpan(
            //   text: 'State Management',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: 'Solutions. Committed to continuous learning and staying ',
            // ),
            // TextSpan(
            //   text: 'Updated ',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: 'with industry ',
            // ),
            // TextSpan(
            //   text: 'Trends. ',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text:
            //       'A self-driven problem solver with strong attention to details. Deployed 3+ apps, to ',
            // ),
            // TextSpan(
            //   text: 'AppStore',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: ', ',
            // ),
            // TextSpan(
            //   text: 'PlayStore ',
            //   style: kTSBoldBody,
            // ),
            // TextSpan(
            //   text: 'and ',
            // ),
            // TextSpan(
            //   text: 'Vercel using Flutter Web.',
            //   style: kTSBoldBody,
            // ),
          ]),
          style: kTSBody,
          maxLines: 12,
          // minLines: 8,
        ),
      ],
    );
  }
}

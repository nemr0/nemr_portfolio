import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/widgets/custom_paint/vertical_dashed_line_painter.dart';
import 'package:nemr_portfolio/config/text_styles.dart';

import '../../../measure_size.dart';

class ExperienceSubWindow extends HookWidget {
  const ExperienceSubWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 25,
    );
    // final firstRowSize = useState<Size?>(null);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Objective',
            style: kTSTitle,
            textAlign: TextAlign.start,
          ),
          spacer,
          MeasureSize(
            builder: (context, size) => Row(
              children: [
                CustomPaint(
                  size: Size(1, size?.height ?? 50),
                  painter: DashedLineVerticalPainter(withCircle: false),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  flex: 3,
                  child: SelectableText(
                    'I’m an aspiring Software Developer with a passion for mobile app development for the potential positive impact they can have on people’s lives. I’m eager to leverage my skills and experiences as well to continuously learn and add new tools to my toolbox to build robust apps that delight consumers.',
                    style: kTSBody,
                  ),
                ),
              ],
            ),
          ),
          spacer,
          const Text(
            'Experience',
            style: kTSTitle,
            textAlign: TextAlign.start,
          ),
          spacer,
          MeasureSize(
            builder: (context, size) => Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomPaint(
                  size: Size(1, size?.height ?? 100),
                  painter: DashedLineVerticalPainter(),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  flex: 3,
                  child: SelectableText.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'DEC 2022 - PRESENT\n',
                      ),
                      TextSpan(
                          text:
                              'FLUTTER DEVELOPER, FREELANCING,\n• Designed UI/UX beautiful websites and mobile apps.\n• Built Mobile Apps with flutter for IOS and Android.\n• Built Flutter Web Apps.\n',
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.white,
                          )),
                      TextSpan(text: 'NOV 2021 – DEC 2022\n'),
                      TextSpan(
                        text:
                            'SOFTWARE DEVELOPER, X-SOLUTIONS,\n• Designed UI/UX beautiful websites and mobile apps.\n• Built Mobile Apps with flutter for IOS and Android.\n• Integrated ERP-Next APIs with Flutter\n• Built print-formats for ERP-Next Engine using HTML, CSS, Jinja & Bootstrap.',
                        style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ], style: kTSExperienceBody),
                  ),
                ),
              ],
            ),
          ),
          spacer,
          const Text('EDUCATION', style: kTSTitle),
          spacer,
          MeasureSize(
            builder: (context, size) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: [
                CustomPaint(
                  size: Size(1, size?.height ?? 50),
                  painter: DashedLineVerticalPainter(),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Expanded(
                  child: SelectableText.rich(TextSpan(
                      text: 'SEP 2017 -  JUL 2021\n',
                      children: [
                        TextSpan(
                          text:
                              'MANAGEMENT INFORMATION SYSTEMS,\nELSHEROUK ACADEMY,\nGraduation Project:',
                          style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.white,
                          ),
                        ),
                        TextSpan(
                          text: '\nSmart Attendance System using QR code.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                      style: kTSExperienceBody)),
                ),
              ],
            ),
          ),
          spacer,
        ],
      ),
    );
  }
}

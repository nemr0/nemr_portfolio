import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show SelectableText;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/widgets/custom_paint/vertical_dashed_line_painter.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:seo/seo.dart';

import '../../../measure_size.dart';

class ExperienceSubWindow extends HookWidget {
  const ExperienceSubWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(
      height: 25,
    );
    const String objectiveWord = 'Objective';
    const String objectiveContentText =
        'I’m an aspiring Software Developer with a passion for mobile app development for the potential positive impact they can have on people’s lives. I’m eager to leverage my skills and experiences as well to continuously learn and add new tools to my toolbox to build robust apps that delight consumers.';
    const String experienceWord = 'Experience';
    const String experienceOne = 'DEC 2022 - PRESENT\n';
    const String experienceTwo =
        'FLUTTER DEVELOPER, FREELANCING,\n• Designed UI/UX beautiful websites and mobile apps.\n• Built Mobile Apps with flutter for IOS and Android.\n• Built Flutter Web Apps.\n';
    const String experienceThree = 'NOV 2021 – DEC 2022\n';
    const String experienceFour =
        'SOFTWARE DEVELOPER, X-SOLUTIONS,\n• Designed UI/UX beautiful websites and mobile apps.\n• Built Mobile Apps with flutter for IOS and Android.\n• Integrated ERP-Next APIs with Flutter\n• Built print-formats for ERP-Next Engine using HTML, CSS, Jinja & Bootstrap.';
    const String educationWord = 'EDUCATION';
    const String educationDate = 'SEP 2017 -  JUL 2021\n';
    const String educationOne =
        'MANAGEMENT INFORMATION SYSTEMS,\nELSHEROUK ACADEMY,\nGraduation Project:';
    const String educationTwo = '\nSmart Attendance System using QR code.';
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Seo.text(
              style: TextTagStyle.h2,
              text: objectiveWord,
              child: const Text(
                objectiveWord,
                style: kTSTitle,
                textAlign: TextAlign.start,
              ),
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
                  Seo.text(
                    text: objectiveContentText,
                    child: const Expanded(
                      flex: 3,
                      child: SelectableText(
                        objectiveContentText,
                        style: kTSBody,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            spacer,
            Seo.text(
              text: experienceWord,
              style: TextTagStyle.h2,
              child: const Text(
                experienceWord,
                style: kTSTitle,
                textAlign: TextAlign.start,
              ),
            ),
            spacer,
            Seo.text(
              text: experienceOne +
                  experienceTwo +
                  experienceThree +
                  experienceFour,
              child: MeasureSize(
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
                            text: experienceOne,
                          ),
                          TextSpan(
                              text: experienceTwo,
                              style: TextStyle(
                                fontSize: 12,
                                color: CupertinoColors.white,
                              )),
                          TextSpan(text: experienceThree),
                          TextSpan(
                            text: experienceFour,
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
            ),
            spacer,
            Seo.text(
                text: educationWord,
                style: TextTagStyle.h2,
                child: const Text(educationWord, style: kTSTitle)),
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
                  Seo.text(
                    text: educationDate + educationOne + educationTwo,
                    child: const Expanded(
                      child: SelectableText.rich(TextSpan(
                          text: educationDate,
                          children: [
                            TextSpan(
                              text: educationOne,
                              style: TextStyle(
                                fontSize: 12,
                                color: CupertinoColors.white,
                              ),
                            ),
                            TextSpan(
                              text: educationTwo,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                          style: kTSExperienceBody)),
                    ),
                  ),
                ],
              ),
            ),
            spacer,
          ],
        ),
      ),
    );
  }
}

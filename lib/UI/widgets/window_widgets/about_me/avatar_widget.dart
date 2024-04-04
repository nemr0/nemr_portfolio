import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/colors.dart';

import '../../../../config/text_styles.dart';
import '../../../../model/link_button_config.dart';
import '../../../helper/custom_paint/name_painter.dart';
import '../../buttons/about_button.dart';
import 'avatar_icon.dart';
import '../../buttons/link_button.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    this.aboutEnabled = true,
  }) : super(key: key);
  final bool aboutEnabled;
  @override
  Widget build(BuildContext context) {



    return GradientBorderGlassBox(
      inColor: kAltContainerColor,
      onlyTopRadius: false,
      hovered: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            // shrinkWrap: true,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (aboutEnabled)
                const Align(
                  alignment: Alignment.topRight,
                  child: AboutButton(),
                ),
              const AvatarIcon(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 6,
                    child: FittedBox(
                      child: Column(
                        children: [
                          const Text(
                            'Omar Elnemr',
                            style: kTSTitle,
                          ),
                          // text: 'Omar Elnemr',
                          AnimatedTextKit(
                            pause: Duration(seconds: 1),
                            animatedTexts: [
                              // TypewriterAnimatedText(
                              //   'Software Engineer',
                              //   textAlign: TextAlign.end,
                              //   textStyle: kTSSubName,
                              // ),
                              TypewriterAnimatedText(
                                'Mobile App Developer',
                                textAlign: TextAlign.end,
                                textStyle: kTSSubName,
                              ),
                              TypewriterAnimatedText(
                                'Flutter Developer',
                                textAlign: TextAlign.end,
                                textStyle: kTSSubName,
                              ),
                              TypewriterAnimatedText(
                                'Short-Content Creator',
                                textAlign: TextAlign.end,
                                textStyle: kTSSubName,
                              ),
                              TypewriterAnimatedText(
                                'Ui/Ux Enthusiastic',
                                textAlign: TextAlign.end,
                                textStyle: kTSSubName,
                              ),
                            ],
                            repeatForever: true,
                          ),
                        ],
                      ),
                      // child: Text.rich(
                      //   TextSpan(
                      //     style: kTSTitle,
                      //     text: 'Omar Elnemr',
                      //     children: [
                      //       TextSpan(
                      //         text: '\nmobile apps dev',
                      //         style: kTSSubName,
                      //       ),
                      //     ],
                      //   ),
                      //   textAlign: TextAlign.end,
                      // ),
                    ),
                  ),
                  Flexible(
                    child: CustomPaint(
                      size: Size(
                        15,
                        44,
                      ),
                      painter: NamePainter(),
                    ),
                  ),
                ],
              ),
              Center(
                child: Wrap(
                  // verticalDirection: VerticalDirection.up,
                  children: [
                    for (LinkButtonConfig config in contactConfigs)
                      LinkButton(config: config),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/link_button.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/model/link_button_config.dart';
import 'package:rive/rive.dart';

import '../../../config/colors.dart';
import '../../../config/text_styles.dart';
import '../../../generated/assets.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Window(
      inColor: kTFColor.withOpacity(.4),
      padding: EdgeInsets.only(
        top: context.height * .04,
        right: context.width * .03,
        left: context.width * .03,
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 4,
            child: SizedBox(
              child: RiveAnimation.asset(
                Assets.rive404,
                stateMachines: ['main'],
                placeHolder: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kContainerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Could not find this page!',
              style: kTSBody,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: LinkButton(onPressed: () => context.pop(),
                  config: LinkButtonConfig(

                      name: 'Go Back Home',
                      color: kContainerColor,
                      icon: FontAwesomeIcons.house))),
        ],
      ),
    );
  }
}

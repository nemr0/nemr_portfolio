import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';

class UnderConstructionWindow extends StatelessWidget {
  const UnderConstructionWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 300,
          height: 300,
          child: RiveAnimation.asset(
            'rive/404.riv',
            stateMachines: ['main'],
            placeHolder: Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: kContainerColor, borderRadius: BorderRadius.circular(10)),
          child: const Text(
            'This one is Under Construction!\n it will be available soon :)',
            style: kTSBody,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

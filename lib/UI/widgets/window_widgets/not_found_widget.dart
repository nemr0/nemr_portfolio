import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

import '../../../config/colors.dart';
import '../../../config/text_styles.dart';
import '../../../generated/assets.dart';
import 'about_me/avatar_widget.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const AvatarWidget(),
        const SizedBox(
          width: 300,
          height: 300,
          child: RiveAnimation.asset(
            Assets.rive404,
            stateMachines: ['main'],
            placeHolder: Center(
              child: CupertinoActivityIndicator(),
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
        IconButton(
          onPressed: () => context.go('/'),
          icon: const FaIcon(
            FontAwesomeIcons.house,
            size: 50,
            color: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}

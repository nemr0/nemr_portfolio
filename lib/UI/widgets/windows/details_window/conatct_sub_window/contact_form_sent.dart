import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/custom_cupertino_button.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/text_by_icon_button.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:rive/rive.dart';

import '../../../../providers/contact_providers.dart';

class ContactFormSent extends StatelessWidget {
  const ContactFormSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: kContainerColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const RiveAnimation.asset(
            'assets/rive/form_sent.riv',
            animations: ['loading_animation'],
            placeHolder: Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kContainerColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Form Successfully Sent!\nI\'ll contact you asap :)',
            style: kTSBody,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              CustomCupertinoButton(
            text: 'Re-Send?',
            onPressed: () {
              GetStorage().remove('desc').then((value) =>
                  ref.read(isFormSentProvider.notifier).state = false);
            },
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const TextByIconButton(),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:rive/rive.dart';

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
              color: kContainerColor, borderRadius: BorderRadius.circular(100)),
          child: const RiveAnimation.network(
            'assets/form_sent.riv',
            animations: ['loading_animation'],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: kContainerColor, borderRadius: BorderRadius.circular(10)),
          child: const Text(
            'Form Successfully Sent!\nI\'ll contact you asap :)',
            style: kTSBody,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}

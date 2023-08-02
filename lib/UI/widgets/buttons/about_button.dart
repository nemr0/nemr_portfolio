import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Tooltip;
import 'package:go_router/go_router.dart';
import '../../../config/colors.dart';
import '../../../config/text_styles.dart';
import '../../router/routes.dart';
import '../glass_morphism.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'About',
      textStyle: kTSAgreement,
      decoration: glassBoxDecoration(
        color: kPrimaryColor.withOpacity(.35),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.goNamed(Routes.about),
        child: const Icon(
          CupertinoIcons.info_circle,
          size: 18,
        ),
      ),
    );
  }
}

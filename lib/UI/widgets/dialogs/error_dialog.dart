import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/colors.dart';

Widget errorDialog(String e, VoidCallback onPressed) => GlassMorphism(
      decoration: glassBoxDecoration(
          color: CupertinoColors.black.withOpacity(.35), radius: 0),
      color: kPrimaryColor.withOpacity(.35),
      height: double.infinity,
      width: double.infinity,
      child: CupertinoAlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              CupertinoIcons.xmark_circle_fill,
              color: CupertinoColors.destructiveRed,
            ),
            Text('Error'),
          ],
        ),
        content: Text(e),
        actions: [
          CupertinoDialogAction(
            onPressed: onPressed,
            child: const Text('Ok'),
          )
        ],
      ),
    );

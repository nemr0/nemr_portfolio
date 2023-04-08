import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/colors.dart';

Widget errorDialog(String e, VoidCallback onPressed) => GlassMorphism(
      glassColor: CupertinoColors.black.withOpacity(.35),
      color: kPrimaryColor.withOpacity(.35),
      height: 100,
      width: 200,
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

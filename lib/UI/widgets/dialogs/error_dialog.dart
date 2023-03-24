import 'package:flutter/cupertino.dart';

Widget errorDialog(String e) => CupertinoAlertDialog(
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
    );

import 'package:flutter/cupertino.dart';

import '../../config/colors.dart';
import '../../config/text_styles.dart';

class CCupertinoButton extends StatelessWidget {
  const CCupertinoButton(
      {Key? key,
      this.onPressed,
      this.btnColor = kPrimaryColor,
      this.isLoading = false,
      required this.text,
      this.padding})
      : super(key: key);
  final bool isLoading;
  final VoidCallback? onPressed;
  final Color? btnColor;
  final String text;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30,
        child: CupertinoTheme(
          data: CupertinoThemeData(primaryColor: btnColor),
          child: CupertinoButton.filled(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
            onPressed: onPressed,
            child: isLoading
                ? const CupertinoActivityIndicator()
                : Text(
                    text,
                    style: kTSSegmentedController,
                  ),
          ),
        ),
      );
}

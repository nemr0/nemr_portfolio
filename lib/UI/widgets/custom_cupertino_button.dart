import 'package:flutter/cupertino.dart';

import '../../config/colors.dart';
import '../../config/text_styles.dart';

const Duration defaultDuration = Duration(milliseconds: 300);

class CCupertinoButton extends StatelessWidget {
  const CCupertinoButton(
      {Key? key,
      this.onPressed,
      this.isLoading = false,
      required this.text,
      this.padding})
      : super(key: key);
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 30,
        child: CupertinoTheme(
          data: const CupertinoThemeData(primaryColor: kPrimaryColor),
          child: CupertinoButton.filled(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
            onPressed: onPressed,
            child: AnimatedCrossFade(
              firstChild: Text(
                text,
                style: kTSSegmentedController,
              ),
              secondChild: const CupertinoActivityIndicator(),
              crossFadeState: isLoading
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: defaultDuration,
            ),
          ),
        ),
      );
}

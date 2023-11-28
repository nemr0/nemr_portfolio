import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/config/colors.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            Expanded(
              child: FaIcon(
                FontAwesomeIcons
                    .triangleExclamation,
                size: 30,
                color: kYellowColor,
              ),
            ),
            Expanded(
              child: FittedBox(
                child: Text(
                  'Could Not Load Image',
                  style:
                  CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(
                      color:
                      kGradientColor),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

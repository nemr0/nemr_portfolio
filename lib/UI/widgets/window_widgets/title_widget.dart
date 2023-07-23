import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/config/colors.dart';

import '../../../config/text_styles.dart';

/// A title Widget with an icon using [FontAwesomeIcon]
class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.icon,
    required this.text,
    this.iconLeftAligned = true,
    this.iconColor = kPrimaryColor,
    this.style = kTSBoldTitle,
    this.iconSize = 30,
    this.spaceBetween = 20,
  });

  final IconData icon;
  final String text;
  final bool iconLeftAligned;
  final Color iconColor;
  final TextStyle style;
  final double iconSize;
  final double spaceBetween;
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      FaIcon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      SizedBox(
        width: spaceBetween,
      ),
      Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: iconLeftAligned ? children : children.reversed.toList(),
    );
  }
}

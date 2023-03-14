import 'package:flutter/cupertino.dart';

import '../../config/colors.dart';
import '../../config/font_families.dart';

const CupertinoThemeData theme = CupertinoThemeData(
  brightness: Brightness.dark,
  textTheme: CupertinoTextThemeData(
      primaryColor: kPrimaryColor,
      textStyle: TextStyle(fontFamily: kQuanticoFamily)),
  scaffoldBackgroundColor: kBgColor,
  primaryColor: kPrimaryColor,
);

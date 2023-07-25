import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;

import 'colors.dart';
import 'font_families.dart';

/// used for my name & titles
const TextStyle kTSTitle = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kVT323Family,
  fontSize: 40,
  letterSpacing: 1,
  height: 0.7,
);

/// used for titles
const TextStyle kTSBoldTitle = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kVT323Family,
  fontSize: 32,
  letterSpacing: 1,
  fontWeight: FontWeight.bold,
  height: 0.7,
);

/// used for my name
const TextStyle kTSBody = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kRobotoMonoFamily,
  fontWeight: FontWeight.w100,
  fontSize: 12,
  height: 1.5,
);

/// used for titles
const TextStyle kTSBoldBody = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kRobotoMonoFamily,
  fontWeight: FontWeight.bold,
  fontSize: 12,
  height: 1.5,
);

/// used for "mobile apps dev" sub title under my name
const TextStyle kTSSubName = TextStyle(
  color: kPrimaryColor,
  fontFamily: kVT323Family,
  fontWeight: FontWeight.w100,
  fontSize: 22,
  height: 1,
);
const TextStyle kTSExperienceBody = TextStyle(
  fontWeight: FontWeight.normal,
  color: kPrimaryColor,
  fontFamily: kRobotoMonoFamily,
  fontSize: 16,
);

/// used for segmented controller items and submit button
const TextStyle kTSSegmentedController = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kRobotoMonoFamily,
  fontSize: 13,
);
const TextStyle kTSAgreement = TextStyle(
  color: CupertinoColors.extraLightBackgroundGray,
  fontFamily: kRobotoMonoFamily,
  fontSize: 11,
);
const TextStyle kSwipeText = TextStyle(
  color: Colors.white24,
  fontFamily: kRobotoMonoFamily,
  fontSize: 11,
);

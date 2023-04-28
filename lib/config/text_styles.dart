import 'package:flutter/cupertino.dart';

import 'colors.dart';
import 'font_families.dart';

/// used for my name & titles
const TextStyle kTSTitle = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kVT323Family,
  fontSize: 40,
);

/// used for my name & titles
const TextStyle kTSBody = TextStyle(
  color: CupertinoColors.white,
  fontFamily: kRobotoMonoFamily,
  fontSize: 12,
);

/// used for "mobile apps dev" sub title under my name
const TextStyle kTSSubName =
    TextStyle(color: kPrimaryColor, fontFamily: kVT323Family, fontSize: 16);
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

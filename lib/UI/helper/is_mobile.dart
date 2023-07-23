import 'package:flutter/foundation.dart';

final bool isMobile = (defaultTargetPlatform != TargetPlatform.linux &&
    defaultTargetPlatform != TargetPlatform.windows &&
    defaultTargetPlatform != TargetPlatform.macOS);

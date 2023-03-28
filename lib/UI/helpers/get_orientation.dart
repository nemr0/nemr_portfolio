import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

Orientation getOrientation(BuildContext context) =>

    /// if not desktop
    (defaultTargetPlatform != TargetPlatform.linux &&
            defaultTargetPlatform != TargetPlatform.windows &&
            defaultTargetPlatform != TargetPlatform.macOS)
        ?

        /// make it portrait
        Orientation.portrait
        : MediaQuery.of(context).orientation;

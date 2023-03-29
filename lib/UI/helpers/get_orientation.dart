import 'package:flutter/cupertino.dart';

import 'is_mobile.dart';

Orientation getOrientation(BuildContext context) =>

    /// if not desktop
    isMobile
        ?

        /// make it portrait
        Orientation.portrait
        : MediaQuery.of(context).orientation;

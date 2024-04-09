import 'package:flutter/cupertino.dart';

import '../is_mobile.dart';

extension ContextConfig on BuildContext {
  /// [MediaQuery].of(context).orientation
  Orientation get orientation =>

      /// if not desktop
      isMobile
          ?

          /// make it portrait
          Orientation.portrait
          : MediaQuery.of(this).orientation;
  bool get portrait =>

      /// if not desktop
    (  isMobile
          ?

          /// make it portrait
          Orientation.portrait
          : MediaQuery.of(this).orientation) == Orientation.portrait;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// [MediaQuery].of(context).size.height
  double get height => MediaQuery.of(this).size.height;

  /// [MediaQuery].of(context).size.width
  double get width => MediaQuery.of(this).size.width;
}

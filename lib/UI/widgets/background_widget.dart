import 'package:flutter/cupertino.dart';

import '../style/constants/colors.dart';

/// A container with background image
class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: kBgColor,
          image: DecorationImage(
              image: AssetImage(
                'assets/background.png',
              ),
              fit: BoxFit.cover)),
      child: child,
    );
  }
}

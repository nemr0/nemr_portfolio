import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemr_portfolio/config/colors.dart';

/// A Container with background image
class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: kBgColor,

            // color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(
                  'background.png',
                ),
                fit: BoxFit.cover)),
        child: child,
      ),
    );
  }
}

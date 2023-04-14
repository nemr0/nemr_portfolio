import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:transparent_image/transparent_image.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: kBgColor,
      child: Stack(
        children: [
          RepaintBoundary(
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: const NetworkImage('/assets/background.png'),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Center(
          //   child: Image.asset(
          //     'background.png',

          //   ),
          // ),
          Center(child: SizedBox(child: child))
          // Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   decoration: const BoxDecoration(
          //
          //       // color: Colors.transparent,
          //       image: DecorationImage(
          //           image: AssetImage(
          //             'background.png',
          //           ),
          //           opacity: .6,
          //           fit: BoxFit.cover)),
          //   child: child,
          // ),
        ],
      ),
    );
  }
}

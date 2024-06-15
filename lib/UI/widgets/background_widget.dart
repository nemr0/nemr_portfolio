import 'package:flutter/material.dart';
import 'package:nemr_portfolio/UI/widgets/image_error_widget.dart';
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
    return ColoredBox(
      color: kBgColor,
      child: Stack(
        children: [
          RepaintBoundary(
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: const AssetImage('assets/images/background.webp'),
              imageErrorBuilder: (_,__,___)=>ImageErrorWidget(),
              fadeInDuration: Duration(milliseconds: 200),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: child,
          ),
        ],
      ),
    );
  }
}

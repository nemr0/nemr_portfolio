import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:rive/rive.dart';

import '../../../../generated/assets.dart';
import '../../../helper/is_mobile.dart';

/// Avatar Icon animated with [Rive]
class AvatarIcon extends HookWidget {
  final double size;

  const AvatarIcon({this.size = 200, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHovered = useState<bool>(false);

    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: AvatarGlow(
        glowColor: kPrimaryColor,
        endRadius: 80,
        child: MouseRegion(
          onExit: (a) => isHovered.value = false,
          onHover: (a) => isHovered.value = true,
          onEnter: (a) => isMobile ? isHovered.value = true : null,
          child: CircleAvatar(
            radius: isHovered.value ? 40 : 50,
            backgroundColor: kPrimaryColor,
            backgroundImage: const AssetImage(Assets.iconsAvatar),
          ),
        ),
      ),
    );
  }
}

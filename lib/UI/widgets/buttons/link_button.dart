import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Tooltip, TooltipState;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/UI/helper/hooks/precache_image_hook.dart';
import 'package:nemr_portfolio/UI/helper/is_mobile.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:seo/html/seo_widget.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../../../model/link_button_config.dart';

onLinkLaunch(
  String link,
  // {bool newPage = true,}
) async {
  html.window.open(
    link,
    '_self',
  );
}

enum ButtonSize {
  large(size: 40),
  small(size: 30);

  const ButtonSize({required this.size});
  final double size;
}

class LinkButton extends HookWidget {
  const LinkButton({super.key, required this.config});

  final LinkButtonConfig config;

  @override
  Widget build(BuildContext context) {
    final tooltipKey = GlobalKey<TooltipState>();
    final Decoration decoration = glassBoxDecoration(
      color: config.asset == null ? kContainerColor : config.color,
    );
    final onHoverSize = useState(ButtonSize.small);
    final image = config.asset == null
        ? GlassMorphism(
            height: onHoverSize.value.size,
            width: onHoverSize.value.size,
            color: kContainerColor,
            child: Center(
              child: FaIcon(
                config.icon,
                color: CupertinoColors.white,
                size: onHoverSize.value.size - 10,
              ),
            ),
          )
        : GlassMorphism(
            height: onHoverSize.value.size,
            width: onHoverSize.value.size,
            color: config.color,
            borderRadius: BorderRadius.circular(3),
            child: usePrecacheImage(Image.asset(
              config.asset!,
              fit: BoxFit.contain,
              height: onHoverSize.value.size - 10,
              width: onHoverSize.value.size - 10,
            )),
          );

    return Seo.link(
      href: config.link ?? '',
      anchor: config.name,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (s) => !isMobile ? onHoverSize.value = ButtonSize.large : null,
        onExit: (s) => onHoverSize.value = ButtonSize.small,
        child: Tooltip(
          key: tooltipKey,
          textStyle: const TextStyle(color: CupertinoColors.white),
          // triggerMode: TooltipTriggerMode.tap,
          message: config.toolTipOn ? config.name : '',
          decoration: config.toolTipOn
              ? decoration
              : const BoxDecoration(color: Color(0x00000000)),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: config.link == null
                ? null
                : () async {
                    tooltipKey.currentState?.ensureTooltipVisible();

                    if (!isMobile) {
                      onHoverSize.value = ButtonSize.small;
                      await Future.delayed(const Duration(milliseconds: 50));
                    }
                    onHoverSize.value = ButtonSize.large;
                    await Future.delayed(const Duration(milliseconds: 100));
                    // tooltipKey.currentState?.();
                    onHoverSize.value = ButtonSize.small;

                    onLinkLaunch((config.link)!);
                  },
            child: image,
          ),
        ),
      ),
    );
  }
}

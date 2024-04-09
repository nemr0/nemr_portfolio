import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Tooltip, TooltipTriggerMode, TooltipVisibility;
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
  const LinkButton( {super.key,this.onPressed,  required this.config,this.buttonSize=ButtonSize.small,this.fromPVL=false, });
  final VoidCallback? onPressed;
  final LinkButtonConfig config;
  final ButtonSize buttonSize;
  final bool fromPVL;
  @override
  Widget build(BuildContext context) {
    final Decoration decoration = glassBoxDecoration(
      color: config.asset == null ? kContainerColor : config.color,
    );
    final onHoverSize = useState(buttonSize);
    final tooltipVisible=useState<bool>(false);
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
        onEnter: (s)
        {
          tooltipVisible.value =true;
          if(!isMobile && !fromPVL) {
          onHoverSize.value = ButtonSize.large;
        }

          },
        onExit: (s) {
          tooltipVisible.value=false;
          if(!fromPVL){
            onHoverSize.value = ButtonSize.small;
          }
        },
        child: TooltipVisibility(
          visible: tooltipVisible.value,
          child: Tooltip(
            textStyle: const TextStyle(color: CupertinoColors.white),
            triggerMode: TooltipTriggerMode.manual,
            // triggerMode: TooltipTriggerMode.tap,
            message: config.toolTipOn ? config.name : '',
            decoration: config.toolTipOn
                ? decoration
                : const BoxDecoration(color: Color(0x00000000)),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed:
            onPressed != null
                  ? () async {
                      // tooltipKey.currentState?.ensureTooltipVisible();

                      if (!isMobile) {
                        onHoverSize.value = ButtonSize.small;
                        await Future.delayed(const Duration(milliseconds: 50));
                      }
                      onHoverSize.value = ButtonSize.large;
                      if(!fromPVL){
                        await Future.delayed(const Duration(milliseconds: 100));
                        // tooltipKey.currentState?.();
                        onHoverSize.value = ButtonSize.small;
                      }

                      onPressed!.call();
                    }
                  :
              config.link == null
                      ? null
                      : () async {

                          if (!isMobile && buttonSize==ButtonSize.small) {
                            onHoverSize.value = ButtonSize.small;
                            await Future.delayed(
                                const Duration(milliseconds: 50));
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
      ),
    );
  }
}
class LinkButtonForPVL extends HookWidget {
  const LinkButtonForPVL(  {super.key,this.addMoreSize=0, required this.onPressed,required this.name, required this.color, required this.asset,  this.buttonSize=ButtonSize.small, });
  final VoidCallback onPressed;
  final String name;
  final Color color;
  final String asset;
  final double addMoreSize;
  final ButtonSize buttonSize;
  @override
  Widget build(BuildContext context) {
    final Decoration decoration = glassBoxDecoration(
      color: color,
    );
    final tooltipVisible=useState<bool>(false);
    final image = GlassMorphism(
            height: buttonSize.size+addMoreSize,
            width: buttonSize.size+addMoreSize,
            color: color,
            borderRadius: BorderRadius.circular(3),
            child: usePrecacheImage(Image.network(
              asset,
              fit: BoxFit.contain,
              height: buttonSize.size ,
              width: buttonSize.size ,
            )),
          );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (s)=> tooltipVisible.value =true,
      onExit: (s) => tooltipVisible.value=false,
      child: TooltipVisibility(
        visible: tooltipVisible.value,
        child: Tooltip(
          textStyle: const TextStyle(color: CupertinoColors.white),
          triggerMode: TooltipTriggerMode.manual,
          // triggerMode: TooltipTriggerMode.tap,
          message: name,
          decoration: decoration,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            child: image,
          ),
        ),
      ),
    );
  }
}

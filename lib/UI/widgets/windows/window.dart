import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Tooltip;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';

import '../../../config/colors.dart';
import '../../helpers/is_mobile.dart';
import '../custom_paint/window_painter.dart';
import '../dialogs/about_dialog.dart';

/// Window Widget for every created window
class Window extends HookConsumerWidget {
  const Window({
    super.key,
    required this.isMinProvider,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.iAdded = false,
  });
  final bool iAdded;
  final Duration duration;
  final StateProvider<bool> isMinProvider;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// shows if the widget is minimized using passed provider
    final isMinimized = ref.watch(isMinProvider.notifier);

    /// on hover is true else false, to give a little animation
    final isHover = useState(false);
    final animationCTR =
        useAnimationController(duration: const Duration(milliseconds: 400));
    final animation =
        useAnimation(Tween(begin: 0.0, end: 1.0).animate(animationCTR));

    /// disables minimized button for passed duration
    final isDisabled = useState<bool>(false);
    // adds a listener to isDisabled to automatically re-assigning
    // its value if true
    useEffect(() {
      isDisabled.addListener(() {
        if (isDisabled.value) {
          Future.delayed(duration, () {
            isDisabled.value = false;
          });
        }
      });
      animationCTR.forward();

      return null;
    }, []);

    return Opacity(
      opacity: animation,
      child: SizedBox(
        height: isMinimized.state ? 120 : null,
        child: MouseRegion(
          onHover: (p) => isMobile ? isHover.value = !isHover.value : null,
          onEnter: (p) => isHover.value = true,
          onExit: (p) => isHover.value = false,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: isHover.value ? 3 : 2,
                  sigmaY: isHover.value ? 5 : 4,
                  tileMode: TileMode.repeated),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CupertinoColors.black.withOpacity(.15),
                        CupertinoColors.black.withOpacity(.20),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: CustomPaint(
                  willChange: true,
                  painter: WindowPainter(isHover: isHover.value),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        AnimatedSize(
                            duration: duration, child: Center(child: child)),
                        if (iAdded)
                          Positioned(
                            right: 8,
                            top: 8,
                            child: Tooltip(
                              message: 'About',
                              decoration: glassBoxDecoration(
                                  color: kPrimaryColor.withOpacity(.35)),
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  showCupertinoDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) =>
                                          const AboutMeDialog());
                                },
                                child: const Icon(
                                  CupertinoIcons.info_circle,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        Positioned(
                          left: 8,
                          top: 8,
                          child: MouseRegion(
                            cursor: isMinimized.state
                                ? SystemMouseCursors.zoomIn
                                : SystemMouseCursors.zoomOut,
                            child: GestureDetector(
                              onTap: isDisabled.value
                                  ? null
                                  : () => {
                                        isMinimized.update((state) => !state),
                                        isDisabled.value = true
                                      },
                              // onMinimized!(isMinimized.state);
                              child: Tooltip(
                                message:
                                    isMinimized.state ? 'Maximize' : 'Minimize',
                                decoration: glassBoxDecoration(
                                    color: isMinimized.state
                                        ? kGreenColor.withOpacity(.35)
                                        : kYellowColor.withOpacity(.35)),
                                child: AnimatedContainer(
                                  duration: duration,
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: isDisabled.value
                                          ? kGradientColor
                                          : isMinimized.state
                                              ? kGreenColor
                                              : kYellowColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/colors.dart';
import '../../helpers/is_mobile.dart';
import '../custom_paint/window_painter.dart';

/// Window Widget for every created window
class Window extends HookConsumerWidget {
  const Window({
    super.key,
    required this.isMinProvider,
    required this.child,
    this.isHoverInit = false,
    this.duration = const Duration(milliseconds: 300),
  });
  final bool isHoverInit;
  final Duration duration;
  final StateProvider<bool> isMinProvider;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// shows if the widget is minimized using passed provider
    final isMinimized = ref.watch(isMinProvider.notifier);

    /// on hover is true else false, to give a little animation
    final isHover = useState(isHoverInit);

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

      return null;
    }, []);

    // animating padding for hover
    return SizedBox(
      height: isMinimized.state ? 120 : null,
      child: MouseRegion(
        onHover: (p) => isMobile ? isHover.value = !isHover.value : null,
        onEnter: (p) => isHover.value = true,
        onExit: (p) => isHover.value = false,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: isHover.value ? 4 : 3,
                sigmaY: isHover.value ? 7 : 5,
                tileMode: TileMode.repeated),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      CupertinoColors.black.withOpacity(.08),
                      CupertinoColors.black.withOpacity(.13),
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
                      Positioned(
                        left: 10,
                        top: 10,
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
                            child: AnimatedContainer(
                              duration: duration,
                              width: 15,
                              height: 15,
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
                    ],
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

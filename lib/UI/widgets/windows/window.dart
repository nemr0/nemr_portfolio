import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../config/colors.dart';
import '../custom_paint/window_painter.dart';

/// Window Widget for every created window
class Window extends HookConsumerWidget {
  const Window({
    super.key,
    required this.isMin,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });
  final Duration duration;
  final StateProvider<bool> isMin;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// shows if the widget is minimized using passed provider
    final isMinimized = ref.watch(isMin.notifier);

    /// on hover is true else false, to give a little animation
    final isHover = useState<bool>(false);

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
    return AnimatedPadding(
      padding: isHover.value == true
          ? const EdgeInsets.all(10)
          : const EdgeInsets.all(0),
      duration: duration,
      // setting height on minimize
      child: SizedBox(
        height: isMinimized.state ? 120 : null,

        /// detect mouse input
        child: MouseRegion(
          onHover: (p) => isHover.value = true,
          onEnter: (p) => isHover.value = true,
          onExit: (p) => isHover.value = false,
          child: CustomPaint(
            willChange: true,

            /// giving on hover to change opacity of container on hover
            painter: WindowPainter(isHover: isHover.value),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(children: [
                AnimatedSize(duration: duration, child: Center(child: child)),
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
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

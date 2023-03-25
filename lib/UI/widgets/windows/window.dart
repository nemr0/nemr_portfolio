import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/colors.dart';
import '../custom_paint/window_painter.dart';

class Window extends HookConsumerWidget {
  const Window({
    super.key,
    required this.isMin,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    // this.height = 400,
    // this.width = 350,
    // this.onMinimized,
  });
  final Duration duration;
  // final void Function(bool val)? onMinimized;
  final AutoDisposeStateProvider<bool> isMin;
  // final double height;
  // final double width;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMinimized = ref.watch(isMin.notifier);
    final isHover = useState<bool>(false);
    final isDisabled = useState<bool>(false);

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
    return AnimatedPadding(
      padding: isHover.value == true
          ? const EdgeInsets.all(10)
          : const EdgeInsets.all(0),
      duration: duration,
      child: SizedBox(
        height: isMinimized.state ? 120 : null,
        child: CustomPaint(
          willChange: true,
          painter: WindowPainter(isHover: isHover.value),
          child: MouseRegion(
            onEnter: (_) => isHover.value = true,
            onExit: (_) => isHover.value = false,
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

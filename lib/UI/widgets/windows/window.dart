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
    // this.height = 400,
    // this.width = 350,
    // this.onMinimized,
  });

  // final void Function(bool val)? onMinimized;
  final AutoDisposeStateProvider<bool> isMin;
  // final double height;
  // final double width;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMinimized = ref.watch(isMin.notifier);
    final isHover = useState<bool>(false);
    const Duration duration = Duration(milliseconds: 300);
    return AnimatedPadding(
      padding: isHover.value == true
          ? const EdgeInsets.all(20)
          : const EdgeInsets.all(30),
      duration: duration,
      child: CustomPaint(
        willChange: true,
        painter: WindowPainter(),
        child: MouseRegion(
          onEnter: (_) => isHover.value = true,
          onExit: (_) => isHover.value = false,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(children: [
              Center(child: child),
              Positioned(
                  left: 5,
                  top: 5,
                  child: MouseRegion(
                    cursor: isMinimized.state
                        ? SystemMouseCursors.zoomIn
                        : SystemMouseCursors.zoomOut,
                    child: GestureDetector(
                      onTap: () => isMinimized.update((state) => !state),
                      // onMinimized!(isMinimized.state);
                      child: AnimatedContainer(
                        duration: duration,
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                                isMinimized.state ? kGreenColor : kYellowColor),
                      ),
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}

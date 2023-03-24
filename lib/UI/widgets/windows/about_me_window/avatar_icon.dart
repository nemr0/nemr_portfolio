import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_providers.dart';
import 'package:rive/rive.dart';

/// Avatar Icon animated with [Rive]
class AvatarIcon extends HookConsumerWidget {
  final double size;
  const AvatarIcon({this.size = 200, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// stateMachine onHover Input
    final hover = useState<SMIBool?>(null);

    void onRiveInit(Artboard artBoard) {
      // Get State Machine Controller for the state machine called "loop"
      final controller = StateMachineController.fromArtboard(artBoard, 'loop');
      artBoard.addController(controller!);
      // Get a reference to the "hover" state machine input
      hover.value = controller.findInput<bool>('hover') as SMIBool;
    }

    final height = MediaQuery.of(context).size.height * .5;
    final isMin = ref.watch(isAvatarMinimizedProvider);
    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: SizedBox.square(
        dimension: isMin ? height * .2 : height * .4,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onExit: (a) {
            if (hover.value == null) return;
            hover.value?.value = false;
          },
          onHover: (a) {
            if (hover.value == null) return;
            hover.value?.value = true;
          },
          child: RiveAnimation.network(
            'assets/logo.riv',
            onInit: onRiveInit,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';

/// Avatar Icon animated with [Rive]
class AvatarIcon extends HookWidget {
  final double size;
  const AvatarIcon({this.size = 200, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// stateMachine onHover Input
    final hover = useState<SMIBool?>(null);

    void onRiveInit(Artboard artBoard) {
      // Get State Machine Controller for the state machine called "loop"
      final controller = StateMachineController.fromArtboard(artBoard, 'loop');
      artBoard.addController(controller!);
      // Get a reference to the "hover" state machine input
      hover.value = controller.findInput<bool>('hover') as SMIBool;
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        height: size,
        width: size,
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
          child: RiveAnimation.asset(
            'logo.riv',
            onInit: onRiveInit,
          ),
        ),
      ),
    );
  }
}

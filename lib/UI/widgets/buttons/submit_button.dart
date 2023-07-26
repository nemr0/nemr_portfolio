import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../helper/is_mobile.dart';
import 'custom_cupertino_button.dart';

typedef FutureCallback = Future<void> Function()?;

class SubmitButton extends HookWidget {
  const SubmitButton({
    Key? key,
    this.onSubmit,
    // required this.isThereAnyError,
  }) : super(key: key);
  final FutureCallback onSubmit;
  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final animationCtr =
        useAnimationController(duration: const Duration(milliseconds: 300));
    final Animation<AlignmentGeometry> animation = (AlignmentTween(
      end: Alignment.centerLeft,
      begin: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: animationCtr,
        curve: Curves.easeInOutCubic,
      ),
    ));
    aligner() {
      if (animationCtr.isAnimating) return;
      // if (isThereAnyError) {
      if (animationCtr.isCompleted) {
        animationCtr.reverse();
      } else {
        animationCtr.forward();
      }
      // }
    }

    return AlignTransition(
      alignment: animation,
      child: MouseRegion(
        onEnter: (_) => onSubmit == null ? aligner() : null,
        child: GestureDetector(
          onTap: isMobile ? aligner : null,
          child: CustomCupertinoButton(
            text: 'Submit',
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isLoading: isLoading.value,
            onPressed: onSubmit == null
                ? null
                : () {
                    isLoading.value = true;
                    onSubmit?.call().then((value) => isLoading.value = false);
                  },
          ),
        ),
      ),
    );
  }
}

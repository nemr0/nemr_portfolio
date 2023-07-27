import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../helper/is_mobile.dart';
import 'custom_cupertino_button.dart';

typedef FutureCallback = Future<void> Function();

class SubmitButton extends HookWidget {
  const SubmitButton({
    Key? key,
    required this.onSubmit,
    // required this.isThereAnyError,
  }) : super(key: key);

  final FutureCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);
    final validated = useState(false);
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
      validated.value = Form.of(context).validate();
      if (validated.value) return;
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
        onEnter: (_) => validated.value ? null : aligner(),
        child: GestureDetector(
          onTap: isMobile
              ? validated.value
                  ? null
                  : aligner
              : null,
          child: CustomCupertinoButton(
            text: 'Submit',
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isLoading: isLoading.value,
            onPressed: validated.value
                ? () {
                    isLoading.value = true;
                    onSubmit.call().then((value) => isLoading.value = false);
                  }
                : null,
          ),
        ),
      ),
    );
  }
}

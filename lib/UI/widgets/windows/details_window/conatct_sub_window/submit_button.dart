import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helpers/is_there_any_errors.dart';

import '../../../../helpers/is_mobile.dart';
import '../../../custom_cupertino_button.dart';

typedef FutureCallback = Future<void> Function();

class SubmitContactButton extends HookConsumerWidget {
  const SubmitContactButton({
    Key? key,
    this.onSubmit,
  }) : super(key: key);
  final FutureCallback? onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isThereAnyError = ref.watch(isThereAnyErrorProvider);
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
      if (isThereAnyError == true) {
        if (animationCtr.isCompleted) {
          animationCtr.reverse();
        } else {
          animationCtr.forward();
        }
      }
    }

    return AlignTransition(
      alignment: animation,
      child: MouseRegion(
        onEnter: (_) => aligner(),
        child: GestureDetector(
          onTap: isMobile ? aligner : null,
          child: CCupertinoButton(
            text: 'Submit',
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isLoading: isLoading.value,
            onPressed: isThereAnyError
                ? null
                : () async {
                    isLoading.value = true;
                    await onSubmit?.call();
                    isLoading.value = false;
                  },
          ),
        ),
      ),
    );
  }
}

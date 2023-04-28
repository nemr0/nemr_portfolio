import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rive/rive.dart';

import '../../../../../config/text_styles.dart';
import '../../../../providers/contact_providers.dart';

class TermsAgree extends HookConsumerWidget {
  const TermsAgree({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTermsAgreed = useState<SMIBool?>(null);
    void onRiveInit(Artboard artBoard) {
      // Get State Machine Controller for the state machine called "loop"
      final controller =
          StateMachineController.fromArtboard(artBoard, 'toggle');
      artBoard.addController(controller!);
      // Get a reference to the "isOn" state machine input
      isTermsAgreed.value = controller.findInput<bool>('isOn') as SMIBool;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CupertinoSwitch(
          //   value: isTermsAgreed,
          //   onChanged: (newValue) => ref
          //       .read(isTermsAgreedProvider.notifier)
          //       .update((state) => newValue),
          //   activeColor: kPrimaryColor,
          // ),
          GestureDetector(
            // cursor: SystemMouseCursors.click,
            onTap: () {
              final bool? termsAgreedVal = (isTermsAgreed.value?.value);
              if (isTermsAgreed.value == null) return;
              isTermsAgreed.value?.value = !termsAgreedVal!;
              ref.read(isTermsAgreedProvider.notifier).state = termsAgreedVal!;
            },
            child: SizedBox(
              height: 30,
              width: 50,
              child: RiveAnimation.asset(
                'assets/rive/switch.riv',
                onInit: onRiveInit,
                fit: BoxFit.cover,
                placeHolder: const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
            child: Text(
              'Accept Saving your contact info and sending you a Welcome Email until I reach out in the nearest possible time. :)',
              maxLines: 4,
              style: kTSAgreement,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/config/colors.dart';

import '../../../../../config/text_styles.dart';
import '../../../../providers/contact_providers.dart';

class TermsAgree extends ConsumerWidget {
  const TermsAgree({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTermsAgreed = ref.watch(isTermsAgreedProvider);
    final width = MediaQuery.of(context).size.width;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CupertinoSwitch(
              value: isTermsAgreed,
              onChanged: (newValue) => ref
                  .read(isTermsAgreedProvider.notifier)
                  .update((state) => newValue),
              activeColor: kPrimaryColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              width: isLandscape ? width * .5 * .7 : width * .6,
              child: const Text(
                'Accept Saving your contact info and sending you a Welcome Email until I reach out in the nearest possible time. :)',
                maxLines: 4,
                style: kTSAgreement,
              ),
            ),
          )
        ],
      ),
    );
  }
}

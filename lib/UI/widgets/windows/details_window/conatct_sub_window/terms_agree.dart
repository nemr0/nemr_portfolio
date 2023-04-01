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
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSwitch(
            value: isTermsAgreed,
            onChanged: (newValue) => ref
                .read(isTermsAgreedProvider.notifier)
                .update((state) => newValue),
            activeColor: kPrimaryColor,
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
          )
        ],
      ),
    );
  }
}

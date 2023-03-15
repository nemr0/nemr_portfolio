import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/config/colors.dart';

class TermsAgree extends HookWidget {
  const TermsAgree({
    Key? key,
    this.onAgreePress,
  }) : super(key: key);
  final Function(bool agreed)? onAgreePress;
  @override
  Widget build(BuildContext context) {
    final isAgreed = useState<bool>(false);

    return Row(
      children: [
        CupertinoSwitch(
          value: isAgreed.value,
          onChanged: (newValue) => {
            isAgreed.value = newValue,
            onAgreePress != null ? onAgreePress!(newValue) : null
          },
          activeColor: kPrimaryColor,
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/helper/on_contact_submit.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/submit_button.dart';
import 'package:nemr_portfolio/config/text_styles.dart';

import '../../../../model/text_field_config.dart';

class ContactMeWidget extends HookWidget {
  const ContactMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List controllers = List.generate(
        configs.length,
        (index) => useTextEditingController(
            text: GetStorage().read(configs[index].storageKey)));
    // [companyCTR, nameCTR, phoneCTR, emailCTR, descCTR];
    double rightPaddingOfTextField() {
      if (context.orientation == Orientation.landscape) {
        return context.width * .08;
      }

      return context.width * .04;
    }

    final validated = useState(false);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {
        Form.maybeOf(primaryFocus!.context!)?.save();
        validated.value =
            Form.maybeOf(primaryFocus!.context!)?.validate() ?? false;
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          right: rightPaddingOfTextField(),
        ),
        child: CupertinoFormSection.insetGrouped(
          footer: Consumer(builder: (context, ref, _) {
            return SubmitButton(
              onSubmit: validated.value
                  ? () async => onSubmit(
                        context,
                        ref,
                        controllers[0].text,
                        controllers[1].text,
                        controllers[2].text,
                        controllers[3].text,
                        controllers[4].text,
                      )
                  : null,
            );
          }),
          backgroundColor: Colors.transparent,
          children: List<Widget>.generate(
            configs.length,
            (index) => HookBuilder(builder: (context) {
              final focus = useFocusNode();
              return CupertinoTextFormFieldRow(
                focusNode: focus,
                onTap: () {
                  focus.requestFocus();
                },
                style: kTSAgreement,
                decoration: const BoxDecoration(color: Colors.transparent),
                prefix: Icon(
                  configs[index].icon,
                ),
                textInputAction: configs[index].inputAction,
                controller: controllers[index],
                placeholder: configs[index].placeholder,
                validator: configs[index].validator,
              );
            }),
          ),
        ),
      ),
    );
  }
}

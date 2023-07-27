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

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          right: rightPaddingOfTextField(),
        ),
        child:
            // Column(
            // children: List<Widget>.generate(
            //     configs.length,
            //     (index) => CupertinoTextFormFieldRow(
            //       autocorrect: false,
            //       autofocus: true,
            //       style: kTSAgreement,
            //       decoration: const BoxDecoration(color: Colors.transparent),
            //       prefix: Icon(
            //         configs[index].icon,
            //       ),
            //       textInputAction: configs[index].inputAction,
            //       controller: controllers[index],
            //       placeholder: configs[index].placeholder,
            //       validator: configs[index].validator,
            //     ),
            //   ),
            // ),

            CupertinoFormSection.insetGrouped(
          footer: Consumer(builder: (context, ref, _) {
            return SubmitButton(
                onSubmit: () async => onSubmit(
                      context,
                      ref,
                      controllers[0].text,
                      controllers[1].text,
                      controllers[2].text,
                      controllers[3].text,
                      controllers[4].text,
                    ));
          }),
          backgroundColor: Colors.transparent,
          children: List<Widget>.generate(
            configs.length,
            (index) => CupertinoTextFormFieldRow(
              inputFormatters: configs[index].inputFormatters,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // autofocus: true,
              keyboardType: configs[index].inputType,
              style: kTSAgreement,
              decoration: const BoxDecoration(color: Colors.transparent),
              prefix: Icon(
                configs[index].icon,
              ),
              onChanged: (v) =>
                  GetStorage().write(configs[index].storageKey, v),
              textInputAction: configs[index].inputAction,
              controller: controllers[index],
              maxLines: configs[index].maxLines,
              minLines: configs[index].minLines,
              placeholder: configs[index].placeholder,
              validator: configs[index].validator,
            ),
          ),
        ),
      ),
    );
  }
}

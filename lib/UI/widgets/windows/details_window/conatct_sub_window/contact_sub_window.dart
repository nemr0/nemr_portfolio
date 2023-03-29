import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helpers/on_contact_submit.dart';
import 'package:nemr_portfolio/UI/providers/contact_providers.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/conatct_sub_window/submit_button.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/conatct_sub_window/terms_agree.dart';

import '../../../../../config/validators.dart';
import 'custom_cupertino_textfield.dart';

class ContactMeWindow extends HookConsumerWidget {
  const ContactMeWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCTR = ref.watch(emailTECProvider),
        companyCTR =
            useTextEditingController(text: GetStorage().read('company')),
        nameCTR = ref.watch(nameTECProvider),
        phoneCTR = ref.watch(phoneTECProvider),
        descCTR = useTextEditingController(text: GetStorage().read('desc'));

    // final orientation = MediaQuery.of(context).orientation;
    const double sHeight = 10;

    List<Widget> children = [
      const SizedBox(
        height: sHeight,
      ),
      // company
      CCTextField(
          controller: companyCTR,
          placeholder: 'Company',
          icon: CupertinoIcons.house_alt_fill,
          inputType: TextInputType.text,
          storageKey: 'company',
          validator: (String? s) => null),
      const SizedBox(
        height: sHeight,
      ),
      // name
      CCTextField(
          controller: nameCTR,
          placeholder: 'Name *',
          icon: CupertinoIcons.profile_circled,
          inputType: TextInputType.name,
          errorProvider: nameErrorProvider,
          storageKey: 'name',
          validator: validateName),
      const SizedBox(
        height: sHeight,
      ),
      // phone
      CCTextField(
          controller: phoneCTR,
          placeholder: 'Phone * exp: 201147898061',
          errorProvider: phoneErrorProvider,
          icon: CupertinoIcons.phone_fill,
          inputType: TextInputType.phone,
          textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
          storageKey: 'phone',
          validator: validateMobile),
      const SizedBox(
        height: sHeight,
      ),
      // email
      CCTextField(
          errorProvider: emailErrorProvider,
          controller: emailCTR,
          placeholder: 'Email *',
          icon: CupertinoIcons.mail_solid,
          inputType: TextInputType.emailAddress,
          storageKey: 'email',
          validator: validateEmail),
      const SizedBox(
        height: sHeight,
      ),
      // description
      CCTextField(
          controller: descCTR,
          placeholder: 'Description (A Brief about what you need) :) ',
          icon: CupertinoIcons.news_solid,
          inputType: TextInputType.text,
          inputAction: TextInputAction.next,
          storageKey: 'desc',
          minLines: 4,
          maxLines: 8,
          validator: (s) => null),
      const SizedBox(
        height: sHeight,
      ),
      const TermsAgree(),
      SubmitContactButton(
        onSubmit: () => onSubmit(context, companyCTR.text, nameCTR.text,
            emailCTR.text, phoneCTR.text, descCTR.text),
      ),
      const SizedBox(
        height: sHeight,
      ),
    ];

    return Column(children: children);
  }
}

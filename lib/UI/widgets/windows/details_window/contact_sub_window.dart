import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../config/validators.dart';
import 'custom_cupertino_textfield.dart';

class ContactMeWindow extends HookWidget {
  const ContactMeWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final emailCTR = useTextEditingController(),
        companyCTR = useTextEditingController(),
        nameCTR = useTextEditingController(),
        phoneCTR = useTextEditingController(),
        descCTR = useTextEditingController();

    final orientation = MediaQuery.of(context).orientation;
    final List<Widget> children = [
      const SizedBox(
        height: 15,
      ),
      // company
      CCTextField(
          controller: companyCTR,
          placeholder: 'Company',
          icon: CupertinoIcons.house_alt_fill,
          inputType: TextInputType.text,
          validator: (String s) => null),
      const SizedBox(
        height: 15,
      ),
      // name
      CCTextField(
          controller: nameCTR,
          placeholder: 'Name *',
          icon: CupertinoIcons.profile_circled,
          inputType: TextInputType.name,
          validator: validateEmail),
      const SizedBox(
        height: 15,
      ),
      // phone
      CCTextField(
          controller: phoneCTR,
          placeholder: 'Phone *',
          icon: CupertinoIcons.phone_fill,
          inputType: TextInputType.phone,
          textInputFormatter: [FilteringTextInputFormatter.digitsOnly],
          validator: validateMobile),
      const SizedBox(
        height: 15,
      ),
      // email
      CCTextField(
          controller: emailCTR,
          placeholder: 'Email *',
          icon: CupertinoIcons.mail_solid,
          inputType: TextInputType.emailAddress,
          validator: validateEmail),
      const SizedBox(
        height: 15,
      ),
      // description
      CCTextField(
          controller: descCTR,
          placeholder: 'Description (A Brief about what you need) :) ',
          icon: CupertinoIcons.news_solid,
          inputType: TextInputType.text,
          inputAction: TextInputAction.next,
          minLines: 4,
          maxLines: 8,
          validator: (s) => null),
      const SizedBox(
        height: 15,
      ),
    ];

    /// making it scrollable in landscape state
    if (orientation == Orientation.landscape) {
      return ListView(
        shrinkWrap: true,
        children: children,
      );
    } else {
      return Column(children: children);
    }
  }
}

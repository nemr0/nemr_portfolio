import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../config/validators.dart';

class TextFieldConfig extends Equatable {
  const TextFieldConfig( {
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines = 1,
    this.autofillHints=const [],
    required this.placeholder,
    required this.storageKey,
    required this.icon,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.validator,
  });
  final List<String> autofillHints;
  final TextInputType inputType;
  final String placeholder;
  final String storageKey;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextInputAction inputAction;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter> inputFormatters;

  @override
  List<Object?> get props => [
        maxLines,
        minLines,
        inputFormatters,
        placeholder,
        storageKey,
        validator,
        icon,
        inputType,
        inputAction
      ];
}

List<TextFieldConfig> configs = [
  const TextFieldConfig(
    autofillHints: [AutofillHints.organizationName],
    placeholder: 'Company',
    storageKey: 'company',
    inputType: TextInputType.name,
    // inputFormatters: [FilteringTextInputFormatter.],
    icon: CupertinoIcons.house_alt_fill,
  ),
  const TextFieldConfig(
    autofillHints: [AutofillHints.givenName,AutofillHints.name,AutofillHints.nickname],

    placeholder: 'Name *',
    storageKey: 'name',
    inputType: TextInputType.name,
    icon: CupertinoIcons.profile_circled,
    validator: validateName,
  ),
  TextFieldConfig(
    autofillHints: [AutofillHints.telephoneNumber],

    placeholder: 'Phone * exp: 201111111111',
    icon: CupertinoIcons.phone_fill,
    inputType: const TextInputType.numberWithOptions(signed: true, decimal: true),
    storageKey: 'phone',

    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    validator: validateMobile,
  ),
  const TextFieldConfig(
    autofillHints: [AutofillHints.email],

    placeholder: 'Email *',
    icon: CupertinoIcons.mail_solid,
    inputType: TextInputType.emailAddress,
    storageKey: 'email',
    validator: validateEmail,
  ),
  const TextFieldConfig(

    placeholder: 'Description (A Brief about what you need) :)\n\n\n',
    icon: CupertinoIcons.news_solid,
    storageKey: 'desc',
    inputType: TextInputType.multiline,
    maxLines: 10,
    minLines: 4,
  ),
];

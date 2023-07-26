import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../config/validators.dart';

class TextFieldConfig extends Equatable {
  const TextFieldConfig({
    required this.placeholder,
    required this.storageKey,
    required this.icon,
    this.inputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.validator,
  });

  final TextInputType inputType;
  final String placeholder;
  final String storageKey;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextInputAction inputAction;

  @override
  List<Object?> get props =>
      [placeholder, storageKey, validator, icon, inputType];
}

const List<TextFieldConfig> configs = [
  TextFieldConfig(
    placeholder: 'Company',
    storageKey: 'company',
    icon: CupertinoIcons.house_alt_fill,
  ),
  TextFieldConfig(
    placeholder: 'Name *',
    storageKey: 'name',
    inputType: TextInputType.name,
    icon: CupertinoIcons.profile_circled,
    validator: validateName,
  ),
  TextFieldConfig(
    placeholder: 'Phone * exp: 201111111111',
    icon: CupertinoIcons.phone_fill,
    inputType: TextInputType.phone,
    storageKey: 'phone',
    validator: validateMobile,
  ),
  TextFieldConfig(
    placeholder: 'Email *',
    icon: CupertinoIcons.mail_solid,
    inputType: TextInputType.emailAddress,
    storageKey: 'email',
    validator: validateEmail,
  ),
  TextFieldConfig(
    placeholder: 'Description (A Brief about what you need) :) ',
    icon: CupertinoIcons.news_solid,
    storageKey: 'desc',
  ),
];

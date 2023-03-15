import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../config/colors.dart';

/// Custom Cupertino Text Field
class CCTextField extends HookWidget {
  const CCTextField({
    super.key,
    required this.controller,
    this.onEditingCompleted,
    required this.placeholder,
    required this.icon,
    required this.inputType,
    this.textInputFormatter,
    this.inputAction,
    this.maxLines,
    this.minLines,
    required this.validator,
  }) : assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        );

  /// Text before typing in the text-field
  final String placeholder;

  /// left icon
  final IconData icon;

  /// keyboard preferences
  final TextInputType inputType;

  ///  keyboard button preferences
  final TextInputAction? inputAction;

  final String? Function(String? s)? validator;
  final int? maxLines;
  final int? minLines;

  /// allowed inputs (leave it null to allow all)
  final List<TextInputFormatter>? textInputFormatter;

  /// TextEditingController
  final TextEditingController controller;

  /// on keyboard button press or on focus change
  final VoidCallback? onEditingCompleted;
  @override
  Widget build(BuildContext context) {
    final error = useState<String?>(null);

    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          right:
              orientation == Orientation.landscape ? width * .1 : width * .05),
      child: CupertinoTextFormFieldRow(
        validator: validator,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        placeholder: placeholder,
        placeholderStyle: error.value == null
            ? const TextStyle(
                fontWeight: FontWeight.w400,
                color: CupertinoColors.placeholderText)
            : const TextStyle(color: CupertinoColors.destructiveRed),
        style: const TextStyle(color: CupertinoColors.extraLightBackgroundGray),
        prefix: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(icon),
        ),
        decoration: BoxDecoration(
            color: kTFColor, borderRadius: BorderRadius.circular(10)),
        keyboardType: inputType,
        textInputAction: inputAction ?? TextInputAction.next,
        keyboardAppearance: Brightness.dark,
        inputFormatters: textInputFormatter,
      ),
    );
  }
}

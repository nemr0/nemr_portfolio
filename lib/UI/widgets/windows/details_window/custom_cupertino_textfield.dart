import 'package:flutter/cupertino.dart';
import 'package:nemr_portfolio/UI/style/constants/colors.dart';

/// TextField Config
class TextFieldConfig {
  final String placeholder;
  final IconData icon;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  TextFieldConfig({
    required this.placeholder,
    required this.icon,
    required this.inputType,
    this.inputAction,
  });
}

/// Custom Cupertino Text Field
class CCTextField extends StatelessWidget {
  const CCTextField({
    super.key,
    this.controller,
    required this.placeholder,
    required this.icon,
    required this.inputType,
    this.inputAction,
    this.onEditingCompleted,
  });

  /// TextEditingController
  final TextEditingController? controller;

  /// Text before typing in the textfield
  final String placeholder;

  /// left icon
  final IconData icon;

  /// keyboard preferences
  final TextInputType inputType;

  ///  keyboard button preferences
  final TextInputAction? inputAction;

  /// on keyboard button press or on focus change
  final VoidCallback? onEditingCompleted;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          right:
              orientation == Orientation.landscape ? width * .1 : width * .05),
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        prefix: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
        decoration: BoxDecoration(
            color: kTFColor, borderRadius: BorderRadius.circular(10)),
        onEditingComplete: onEditingCompleted,
        keyboardType: inputType,
        textInputAction: inputAction ?? TextInputAction.next,
        keyboardAppearance: Brightness.dark,
      ),
    );
  }
}

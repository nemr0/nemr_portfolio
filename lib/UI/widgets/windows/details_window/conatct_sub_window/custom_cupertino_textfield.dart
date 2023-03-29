import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/config/text_styles.dart';

import '../../../../../config/colors.dart';

/// Custom Cupertino Text Field
class CCTextField extends HookConsumerWidget {
  const CCTextField({
    super.key,
    required this.storageKey,
    required this.controller,
    this.isDisabled = false,
    this.noRightPadding,
    this.onEditingCompleted,
    this.placeholder = '',
    required this.icon,
    this.inputType = TextInputType.text,
    this.textInputFormatter,
    this.inputAction,
    this.maxLines,
    this.minLines,
    this.errorProvider,
    this.validator,
  }) : assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        );
  final String storageKey;

  /// Text before typing in the text-field
  final String placeholder;

  /// left icon
  final IconData icon;
  final bool isDisabled;

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
  final AutoDisposeStateProvider<String?>? errorProvider;
  final bool? noRightPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final orientation = MediaQuery.of(context).orientation;
    final error = errorProvider != null ? ref.watch(errorProvider!) : null;
    useEffect(() {
      if (errorProvider != null) {
        controller.addListener(() {
          ref.watch((errorProvider?.notifier)!).state =
              validator!(controller.text);
        });
      }
      return null;
    }, [controller]);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: noRightPadding == true
                  ? 0
                  : orientation == Orientation.landscape
                      ? width * .1
                      : width * .05),
          child: CupertinoTextField(
            readOnly: isDisabled,
            onTapOutside: (s) => onEditingCompleted,
            controller: controller,
            minLines: minLines,
            maxLines: maxLines,
            placeholder: placeholder,
            onChanged: (string) {
              final errorProvider = this.errorProvider;
              if (errorProvider != null) {
                ref.read((errorProvider.notifier)).state = validator!(string);
              }
              if (string.isNotEmpty) GetStorage().write(storageKey, string);
            },
            style: isDisabled
                ? const TextStyle(color: CupertinoColors.activeGreen)
                : const TextStyle(
                    color: CupertinoColors.extraLightBackgroundGray),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                icon,
                color: isDisabled ? CupertinoColors.activeGreen : null,
              ),
            ),
            decoration: BoxDecoration(
                color: kTFColor, borderRadius: BorderRadius.circular(10)),
            keyboardType: inputType,
            textInputAction: inputAction ?? TextInputAction.next,
            keyboardAppearance: Brightness.dark,
            inputFormatters: textInputFormatter,
          ),
        ),
        if (error != null && !isDisabled)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              (error),
              style:
                  kTSAgreement.copyWith(color: CupertinoColors.destructiveRed),
            ),
          )
      ],
    );
  }
}

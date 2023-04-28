import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/contact_providers.dart';

/// if true there's an error
final isThereAnyErrorProvider = Provider.autoDispose<bool>((ref) {
  final emailError = ref.watch(emailErrorProvider);
  final nameError = ref.watch(nameErrorProvider);
  final phoneError = ref.watch(phoneErrorProvider);
  final isEmailEmpty = ref.watch(emailTECProvider).text.isEmpty;
  final isPhoneEmpty = ref.watch(phoneTECProvider).text.isEmpty;
  final isNameEmpty = ref.watch(nameTECProvider).text.isEmpty;
  final isTermsAgreed = ref.watch(isTermsAgreedProvider);

  return isNameEmpty ||
      isEmailEmpty ||
      isPhoneEmpty ||
      phoneError != null ||
      emailError != null ||
      nameError != null ||
      !isTermsAgreed;
  // return false;
});

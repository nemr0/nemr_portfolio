import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// terms not agreed if false
final isTermsAgreedProvider = StateProvider.autoDispose((ref) => false);

/// no errors if null
/// Name Error provider
final nameErrorProvider = StateProvider.autoDispose<String?>((ref) => null);

/// no errors if null
/// Phone Error Provider
final phoneErrorProvider = StateProvider.autoDispose<String?>((ref) => null);

/// no errors if null
/// Email Error Provider
final emailErrorProvider = StateProvider.autoDispose<String?>((ref) => null);

/// listens to get_storage key "form_sent" and update on change
final isFormSentProvider = StateProvider<bool?>((ref) {
  bool? isFormSent = GetStorage().read('form_sent');

  return isFormSent;
});

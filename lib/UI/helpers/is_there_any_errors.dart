import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/contact_providers.dart';

/// if true there's an error
final isThereAnyErrorProvider = Provider.autoDispose<bool>((ref) {
  final email = ref.watch(emailErrorProvider);
  final name = ref.watch(nameErrorProvider);
  final isTermsAgreed = ref.watch(isTermsAgreedProvider);
  return email != null || name != null || isTermsAgreed == false;
  // return false;
});

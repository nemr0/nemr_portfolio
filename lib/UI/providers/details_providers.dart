import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_providers.dart';

/// Global Details Window Provider:
///
///
final segmentedValueProvider = StateProvider<int>((ref) {
  return 2;
});

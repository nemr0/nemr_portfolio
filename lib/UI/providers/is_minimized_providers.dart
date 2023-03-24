import 'package:hooks_riverpod/hooks_riverpod.dart';

/// avatar window is minimized bool global provider
final isAvatarMinimizedProvider = StateProvider.autoDispose((ref) => false);

/// details window is minimized bool global provider
final isDetailsMinimizedProvider = StateProvider.autoDispose((ref) => false);

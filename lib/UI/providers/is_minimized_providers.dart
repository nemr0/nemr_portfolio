import 'package:hooks_riverpod/hooks_riverpod.dart';

/// avatar window is minimized bool global provider
final isAboutMeMinimizedProvider = StateProvider<bool>((ref) => false);

/// details window is minimized bool global provider
final isDetailsMinimizedProvider = StateProvider<bool>((ref) => false);

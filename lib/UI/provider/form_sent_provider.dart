import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isFormSentProvider =
    StateProvider((ref) => GetStorage().read('form_sent') ?? false);

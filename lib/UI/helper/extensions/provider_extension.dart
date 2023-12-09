import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ProviderExtension<T> on StateProvider<T>{
   void setState (WidgetRef ref,T value)=> ref.read(this.notifier).state=value;
}
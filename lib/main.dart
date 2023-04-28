import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/main_screen.dart';
import 'package:seo/seo.dart';
import 'UI/style/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

//ignore: prefer-match-file-name
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// using seo package
    return SeoController(
      enabled: true,

      /// widget tree observer
      tree: WidgetTree(context: context),

      /// cupertino app
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Omar Elnemr',
        theme: theme,

        /// Start point
        home: MainScreen(),
      ),
    );
  }
}

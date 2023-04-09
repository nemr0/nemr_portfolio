import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:nemr_portfolio/UI/main_screen.dart';
import 'package:seo/seo.dart';
import 'UI/style/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  // Define MetaSEO object
  MetaSEO meta = MetaSEO();
  // add meta seo data for web app as you want
  meta.author(author: 'Omar Elnemr');
  meta.description(description: 'Omar Elnemr\'s Portfolio.');
  meta.keywords(
      keywords:
          'Flutter, Developer, Mobile Apps Developer, Flutter Developer, Flutter Mobile, Omar Elnemr');
  meta.nameContent(name: 'Omar Elnemr', content: 'Flutter Developer Portfolio');
  // meta.ogImage(ogImage: '')
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

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
      ).animate().fadeIn(duration: const Duration(milliseconds: 400)),
    );
  }
}

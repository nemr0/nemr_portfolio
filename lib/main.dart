import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/main_screen.dart';
import 'package:seo/seo.dart';
import 'UI/style/theme.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: const CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Omar Elnemr',
        theme: theme,
        home: MainScreen(),
      ),
    );
  }
}

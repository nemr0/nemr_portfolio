import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seo/seo.dart';
import 'package:url_strategy/url_strategy.dart';

import 'UI/router/router_config.dart';
import 'UI/style/theme.dart';

Future<void> main() async {
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(MyApp());
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

      /// Material App
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'Omar Elnemr',
        theme: theme,
      ),
    );
  }
}

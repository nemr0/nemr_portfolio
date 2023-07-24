import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/router/routes.dart';
import 'package:nemr_portfolio/model/project_config.dart';

import '../start_point.dart';
import '../widgets/background_widget.dart';
import '../widgets/dialogs/about_me_dialog.dart';
import '../widgets/window_widgets/not_found_widget.dart';
import '../widgets/window_widgets/projects/project_view.dart';
import '../widgets/window_widgets/window.dart';
import 'cupertino_modal_popup_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartPoint(),
      routes: [
        GoRoute(
          path: 'projects',
          routes: [
            GoRoute(
              path: Routes.projectHalaJary,
              name: Routes.projectHalaJary,
              pageBuilder: (context, state) => CupertinoModalPopupPage(
                builder: (BuildContext context) => ProjectView(
                  config: configs[0],
                ),
              ),
            ),
            GoRoute(
              path: Routes.projectLocalizationTextGenerator,
              name: Routes.projectLocalizationTextGenerator,
              pageBuilder: (context, state) => CupertinoModalPopupPage(
                builder: (BuildContext context) => ProjectView(
                  config: configs[1],
                ),
              ),
            ),
            GoRoute(
              path: Routes.projectDartDonut,
              name: Routes.projectDartDonut,
              pageBuilder: (context, state) => CupertinoModalPopupPage(
                builder: (BuildContext context) => ProjectView(
                  config: configs[2],
                ),
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              ),
            ),
            GoRoute(
              path: Routes.projectImIn,
              name: Routes.projectImIn,
              pageBuilder: (context, state) => CupertinoModalPopupPage(
                builder: (BuildContext context) => ProjectView(
                  config: configs[3],
                ),
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              ),
            ),
          ],
          builder: (context, state) => const StartPoint(),
        ),
        GoRoute(
          path: Routes.about,
          name: Routes.about,
          pageBuilder: (context, state) => CupertinoModalPopupPage(
            builder: (context) => const AboutMeDialog(),
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          ),
        ),
        GoRoute(
          path: Routes.error,
          name: Routes.error,
          builder: (context, state) => BackgroundWidget(
            child: Window(
              padding: EdgeInsets.only(
                top: context.height * .05,
                right: context.width * .05,
                left: context.width * .05,
              ),
              child: const NotFoundWidget(),
            ),
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => BackgroundWidget(
    child: Window(
      padding: EdgeInsets.only(
        top: context.height * .05,
        right: context.width * .05,
        left: context.width * .05,
      ),
      child: const NotFoundWidget(),
    ),
  ),
);

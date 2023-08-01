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
        pageBuilder: (context, state) =>
            CupertinoPage(key: state.pageKey, child: const StartPoint()),
        routes: [
          GoRoute(
            path: 'projects',
            routes: [
              for (ProjectConfig config in configs)
                GoRoute(
                  path: config.id,
                  name: config.id,
                  pageBuilder: (context, state) => CupertinoModalPopupPage(
                    key: state.pageKey,
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    builder: (BuildContext context) =>
                        ProjectView(config: config),
                  ),
                ),
            ],
            builder: (context, state) => const StartPoint(),
          ),
          GoRoute(
            path: Routes.about,
            name: Routes.about,
            pageBuilder: (context, state) => CupertinoModalPopupPage(
              key: state.pageKey,
              builder: (context) => const AboutMeDialog(),
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            ),
          ),
          GoRoute(
            path: Routes.error,
            name: Routes.error,
            pageBuilder: (context, state) => CupertinoModalPopupPage(
              key: state.pageKey,
              builder: (context) => BackgroundWidget(
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
          // GoRoute(path: Routes.contactMe)
        ],
      ),
    ],
    errorBuilder: (context, state) {
      // use a post frame callback to perform your navigation after
      // the build frame has finished
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.goNamed(Routes.error);
      });

      // you must return a widget anyway
      return const SizedBox.shrink();
    });

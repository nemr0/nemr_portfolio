import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/router/routes.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_view_list.dart';

import '../../model/project_config.dart';
import '../start_point.dart';
import '../widgets/dialogs/about_me_dialog.dart';
import '../widgets/window_widgets/not_found_widget.dart';
import 'cupertino_modal_popup_page.dart';

final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartPoint(),
        pageBuilder: (context, state) =>
            CupertinoPage(key: state.pageKey, child: const StartPoint()),
        routes: [
          // for (ProjectConfig config in configs)
          //   GoRoute(
          //     path: 'project/${config.id}',
          //     name: config.id,
          //     pageBuilder: (context, state) => HeroPage(
          //       key: state.pageKey,
          //       filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          //       builder: (BuildContext context) => ProjectView(config: config),
          //     ),
          //   ),

          for (ProjectConfig config in configs)
            GoRoute(
              path: 'project/:id',
              name: config.id,
              pageBuilder: (context, state) => HeroPage(
                key: state.pageKey,
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                builder: (BuildContext context) => ProjectViewList(
                  id: state.pathParameters['id'].toString(),
                ),
              ),
            ),

          GoRoute(
            path: Routes.about,
            name: Routes.about,
            pageBuilder: (context, state) => HeroPage(
              key: state.pageKey,
              builder: (context) => const AboutMeDialog(),
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            ),
          ),
          GoRoute(
            path: Routes.error,
            name: Routes.error,
            pageBuilder: (context, state) => HeroPage(
              key: state.pageKey,
              builder: (context) => const NotFoundWidget(),
            ),
            builder: (context, state) => const NotFoundWidget(),
          ),
          // GoRoute(path: Routes.contactMe)
        ],
      ),
    ],
    // errorPageBuilder: (context,state)=>,
    errorBuilder: (context, state) {
      // use a post frame callback to perform your navigation after
      // the build frame has finished
      WidgetsBinding.instance
          .addPostFrameCallback((timeStamp) => context.goNamed(Routes.error));

      // you must return a widget anyway
      return const SizedBox.shrink();
    });

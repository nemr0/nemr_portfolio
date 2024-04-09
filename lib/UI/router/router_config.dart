import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart' deferred as hook;
import 'package:go_router/go_router.dart';
import 'package:nemr_portfolio/UI/router/routes.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_view_list.dart'
    deferred as projectListView;

import '../../model/project_config.dart';
import '../helper/deferred_widget.dart';
import '../start_point.dart' ;
import '../widgets/dialogs/about_me_dialog.dart' deferred as aboutMe;
import '../widgets/window_widgets/not_found_widget.dart' deferred as notFound;
import 'cupertino_modal_popup_page.dart';

final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>const StartPoint(),
        pageBuilder: (context, state) => CupertinoPage(
            key: state.pageKey,
            child: StartPoint(),),
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
              name: config.route,
              pageBuilder: (context, state) => HeroPage(
                key: state.pageKey,
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                builder: (BuildContext context) =>
                    DeferredWidget(
                      key: ValueKey(state.pathParameters['id'].toString()),
                      builder:()=> projectListView.ProjectViewList(
                                        id: state.pathParameters['id'].toString(),
                                      ), loadLibrary: projectListView.loadLibrary,
                    ),
              ),
            ),

          GoRoute(
            path: Routes.about,
            name: Routes.about,
            pageBuilder: (context, state) => HeroPage(
              key: state.pageKey,
              builder: (context) => DeferredWidget(
                key: ValueKey('aboutMe'),
                builder: ()=>aboutMe.AboutMeDialog(), loadLibrary: aboutMe.loadLibrary, ),
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            ),
          ),
          GoRoute(
            path: Routes.error,
            name: Routes.error,
            pageBuilder: (context, state) => HeroPage(
              key: state.pageKey,
              builder: (context) => DeferredWidget(key:ValueKey('notFound'),builder:()=> notFound.NotFoundWidget(), loadLibrary: notFound.loadLibrary,),
            ),
            builder: (context, state) => DeferredWidget(key:ValueKey('notFound'),builder:()=> notFound.NotFoundWidget(), loadLibrary: notFound.loadLibrary,),
          ),
          // GoRoute(path: Routes.contactMe)
        ],
      ),
    ],
    // errorPageBuilder: (context,state)=>,
    errorBuilder: (context, state) {



      return DeferredWidget(
        builder: () => hook.HookBuilder(builder: (context) {
          hook.useEffect(() {
            // use a post frame callback to perform your navigation after
            // the build frame has finished
            WidgetsBinding.instance
                .addPostFrameCallback((timeStamp) => context.goNamed(Routes.error));
            return null;
          });
          // you must return a widget anyway
          return const SizedBox.shrink();
        }),
        loadLibrary: hook.loadLibrary,  key: ValueKey('notFound404'),
      );
    });

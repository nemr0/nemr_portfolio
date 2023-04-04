import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helpers/get_orientation.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_providers.dart';
import 'package:nemr_portfolio/UI/widgets/background_widget.dart';
import 'package:nemr_portfolio/UI/widgets/windows/about_me_window/about_me_window.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/details_window.dart';

/// Where everything is rendered
class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAboutMeMinimized = ref.watch(isAboutMeMinimizedProvider);
    final isDetailsMinimized = ref.watch(isDetailsMinimizedProvider);
    final orientation = getOrientation(context);

    return BackgroundWidget(
      /// Landscape
      child: (orientation == Orientation.landscape)
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Flexible(
                    flex: 8,
                    child: Column(
                      children: [
                        const Spacer(),
                        Flexible(
                            flex: isAboutMeMinimized ? 1 : 4,
                            fit: FlexFit.tight,
                            child: const AboutMeWindow()),
                        const Spacer(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                      flex: 12,
                      child: Column(
                        children: [
                          const Spacer(),
                          Flexible(
                              flex: isDetailsMinimized ? 1 : 10,
                              child: const DetailsWindow()),
                          const Spacer(),
                        ],
                      )),
                  const Spacer(),
                ],
              ),
            )
          :

          /// Portrait
          HookBuilder(builder: (BuildContext context) {
              final scrollCTR = useScrollController();

              return CupertinoScrollbar(
                thumbVisibility: true,
                controller: scrollCTR,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView(
                      controller: scrollCTR,
                      shrinkWrap: true,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        AboutMeWindow(),
                        SizedBox(
                          height: 20,
                        ),
                        DetailsWindow(),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
    );
  }
}

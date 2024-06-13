import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/link_button.dart';
import 'package:nemr_portfolio/UI/widgets/provider/scroll_on_top_provider.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_view.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/model/project_config.dart';


class ProjectViewList extends HookConsumerWidget {
  const ProjectViewList({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOnTop = ref.watch(scrollOnTopProvider);

    final pageViewCTR = usePageController(
        initialPage: configs.indexWhere((element) => element.route == id),
        viewportFraction: scrollOnTop ? 0.9 : 1,
        keys: [scrollOnTop]);
    final cachedIndex=useState(configs.indexWhere((element) => element.route == id));

    return Column(
      children: [
        scrollOnTop?Expanded(child: OverlayMenu(index: cachedIndex.value, pageViewCTR: pageViewCTR,)):const SizedBox.shrink(),
        // AnimatedSwitcher(duration: Duration(milliseconds: 500),
        // child: scrollOnTop?Expanded(child: OverlayMenu(index: cachedIndex.value, pageViewCTR: pageViewCTR,)):const SizedBox.shrink()),
        Expanded(
          flex: 11,
          child: PageView.builder(
            physics: scrollOnTop
                ? PageScrollPhysics()
                : NeverScrollableScrollPhysics(),
            allowImplicitScrolling: true,
            controller: pageViewCTR,
            itemBuilder: (BuildContext context, int index) => ProjectView(
              config: configs[index],
              currentIndex: index,
            ),
            onPageChanged: (v) {
              cachedIndex.value=v;
              context.goNamed(configs[v].route, pathParameters: {'id': configs[v].route});
            },
            itemCount: configs.length - 1,
          ),
        ),
      ],
    );

  }
}

class OverlayMenu extends ConsumerWidget {
  const OverlayMenu( {required this.index,
    required this.pageViewCTR,
    super.key,
  });
  final int index;
  final PageController pageViewCTR;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cachedIndex = ref.watch(cachedIndexProvider);

    return SizedBox(
      height: context.portrait?context.height * (1 / 11):context.height * (2 / 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          for (ProjectConfig config in configs)
            if (configs.indexOf(config) != configs.length-1)
              LinkButtonForPVL(
                addMoreSize: context.height*.009,
                  buttonSize:
                  // cachedIndex == config.index
               index == configs.indexOf(config)   ? ButtonSize.large
                      :
                  ButtonSize.small,
                  onPressed: () {
                    pageViewCTR.animateToPage(configs.indexOf(config),
                        duration: Duration(milliseconds: 200),
                        curve: Curves.bounceInOut);
                    // cachedIndexProvider.setState(ref, config.index);
                    // cachedIndexProvider.setState(ref) = config.index;
                  },
                  name: config.name,
                  color: kAltContainerColor,
                  asset: config.url)
        ],
      ),
    );
  }
}

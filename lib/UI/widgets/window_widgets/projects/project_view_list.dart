import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/widgets/provider/scroll_on_top_provider.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_view.dart';
import 'package:nemr_portfolio/model/project_config.dart';

class ProjectViewList extends HookConsumerWidget {
  const ProjectViewList({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOnTop = ref.watch(scrollOnTopProvider);
    final pageCTR = usePageController(
        initialPage: index,
        viewportFraction: scrollOnTop ? 0.9 : 1,
        keys: [scrollOnTop]);
    return PageView.builder(
      physics: scrollOnTop
          ? ClampingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      allowImplicitScrolling: true,
      controller: pageCTR,
      itemBuilder: (BuildContext context, int index) => ProjectView(
        config: configs[index],
        currentIndex: index,
      ),
      itemCount: configs.length - 1,
    );
  }
}

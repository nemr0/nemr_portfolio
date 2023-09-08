import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_view.dart';
import 'package:nemr_portfolio/model/project_config.dart';

class ProjectViewList extends HookWidget {
  const ProjectViewList({Key? key, this.index = 0}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final scrollOnTop = useState<bool>(true);
    final pageCTR = usePageController(
        initialPage: index,
        viewportFraction: scrollOnTop.value ? 0.9 : 1,
        keys: [scrollOnTop.value]);
    return PageView.builder(
      physics: scrollOnTop.value
          ? ClampingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      allowImplicitScrolling: true,
      controller: pageCTR,
      itemBuilder: (BuildContext context, int index) => ProjectView(
        config: configs[index],
        currentIndex: index,
        topScrollChanged: (bool topScroll) {
          scrollOnTop.value = topScroll;
        },
      ),
      itemCount: configs.length - 1,
    );
  }
}

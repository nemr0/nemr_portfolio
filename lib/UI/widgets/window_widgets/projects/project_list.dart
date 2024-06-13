import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_widget.dart';

import '../../../../model/project_config.dart';

class ProjectList extends ConsumerWidget {
  const ProjectList({
    super.key,
    required this.projectCTR,
    required this.length,
    required this.currentPage,

    // required this.currentIndex,
  });
  final double length;
  final PageController projectCTR;
  // final int currentIndex;
  final int currentPage;
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return SizedBox(
      height: length,
      child: PageView.builder(
        controller: projectCTR,
        itemBuilder: (ctx, i) => ProjectWidget(
          current: i == currentPage,
          config: configs[i],
          length: length,
          last: i == configs.length - 1,
        ),
        itemCount: configs.length,
        // onItemFocus: (int index) => onPageChanged?.call(index),
      ),
    );
  }
}

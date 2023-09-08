// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_widget.dart';

import '../../../../model/project_config.dart';

class ProjectList extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: length,
      child: PageView.builder(
        pageSnapping: false,
        // scale: .7,
        physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),

        controller: projectCTR,
        // numberOfCardsDisplayed: configs.length - 2,
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

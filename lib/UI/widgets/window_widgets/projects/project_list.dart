import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/link_button.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_widget.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/window.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/model/link_button_config.dart';

import '../../../../model/project_config.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
    required this.projectCTR,
    this.onPageChanged,
    required this.currentIndex,
  });

  final void Function(int)? onPageChanged;
  final PageController projectCTR;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .3,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              itemCount: configs.length,
              controller: projectCTR,
              onPageChanged: onPageChanged,
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == currentIndex ? 1 : 0.9,
                  child: ProjectWidget(
                    config: configs[i],
                    last: i == configs.length - 1,
                  ),
                );
              },
            ),
          ),
          if (currentIndex != 2)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  projectCTR.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.solidCircleLeft,
                  size: 20,
                  color: CupertinoColors.white,
                ),
              ),
            ),
          if (currentIndex != 0)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  projectCTR.previousPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn,
                  );
                },
                icon: const FaIcon(
                  FontAwesomeIcons.solidCircleRight,
                  size: 20,
                  color: CupertinoColors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nemr_portfolio/UI/helper/extensions/context_config.dart';
import 'package:nemr_portfolio/UI/widgets/window_widgets/projects/project_widget.dart';

import '../../../../model/project_config.dart';

class ProjectList extends HookWidget {
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
    useAutomaticKeepAlive(wantKeepAlive: true);
    return SizedBox(
      height: context.height * .3,
      child: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: configs.length,
              controller: projectCTR,
              onPageChanged: onPageChanged,
              itemBuilder: (_, i) {
                return ProjectWidget(
                  config: configs[i],
                  last: i == configs.length - 1,
                  clickable: i == currentIndex,
                );
              },
            ),
          ),
          Positioned.fill(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (currentIndex != configs.length - 1)
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => projectCTR.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.black,
                            shape: BoxShape.circle),
                        child: const FaIcon(
                          FontAwesomeIcons.solidCircleLeft,
                          size: 30,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              if (currentIndex == configs.length - 1)
                const Expanded(flex: 2, child: SizedBox()),
              const Spacer(
                flex: 3,
              ),
              if (currentIndex == 0) const Expanded(flex: 2, child: SizedBox()),
              if (currentIndex != 0)
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => projectCTR.previousPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: CupertinoColors.black,
                            shape: BoxShape.circle),
                        child: const FaIcon(
                          FontAwesomeIcons.solidCircleRight,
                          size: 30,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          )),
        ],
      ),
    );
  }
}

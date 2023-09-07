// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
  final CardSwiperController projectCTR;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final double length = context.height * .3;
    useAutomaticKeepAlive(wantKeepAlive: true);

    return SizedBox(
      height: length,
      child: CardSwiper(
        scale: .7,
        initialIndex: currentIndex,
        // physics: const NeverScrollableScrollPhysics(),
        cardsCount: configs.length,
        onSwipe: (_, c, d) {
          onPageChanged?.call(c!);
          if (d == CardSwiperDirection.none) projectCTR.swipeRight();
          // switch (d) {
          //     case CardSwiperDirection.right:
          //     case CardSwiperDirection.top:
          //
          //     case CardSwiperDirection.left:
          //     case CardSwiperDirection.bottom:
          //       // onPageChanged?.call(c! - 2);
          //       controller.value
          //         ..undo()
          //         ..undo();
          //     case CardSwiperDirection.none:
          //     default:
          //   }

          return true;
        },

        controller: projectCTR,
        numberOfCardsDisplayed: configs.length - 2,
        cardBuilder: (ctx, i, __, ___) {
          if (i == configs.length - 1)
            return GithubProjectWidget(length: length);

          return ProjectWidget(
            config: configs[i],
            last: i == configs.length - 1,
            clickable: i == currentIndex,
            length: length,
          );
        },
      ),
    );
  }
}

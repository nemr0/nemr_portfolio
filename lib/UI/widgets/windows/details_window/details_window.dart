import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/providers/details_providers.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_providers.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/experience_sub_window/experience_sub_window.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/under_construction_sub_window.dart';
import 'package:nemr_portfolio/UI/widgets/windows/window.dart';

import '../../../../config/colors.dart';
import '../../../../config/text_styles.dart';
import '../../../helpers/get_orientation.dart';
import '../../../providers/contact_providers.dart';
import 'conatct_sub_window/contact_form_sent.dart';
import 'conatct_sub_window/contact_sub_window.dart';

/// a window that separated with three Sliding Segmented Controls
/// "Project" , "Experience" and, "Contact"
class DetailsWindow extends HookConsumerWidget {
  const DetailsWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMin = ref.watch(isDetailsMinimizedProvider);
    final segmentedValue = ref.watch(segmentedValueProvider);
    const Duration duration = Duration(milliseconds: 400);
    final isFormSent = ref.watch(isFormSentProvider);
    final orientation = getOrientation(context);
    final scrollCTR = useScrollController();
    const List<Widget> selectedWidget = [
      SizedBox.shrink(),
      UnderConstructionSubWindow(),
      ExperienceSubWindow(),
      ContactSubWindow(),
      ContactFormSent(),
    ];

    selectIndex(bool isMin, int segmentedValue, bool? isFormSent) {
      if (isMin) {
        return 0;
      }
      if (segmentedValue == 0 || segmentedValue == 1) return segmentedValue + 1;
      if (isFormSent == true) {
        return 4;
      }

      return 3;
    }

    useEffect(
      () {
        GetStorage().listenKey('form_sent', (value) {
          ref.read(isFormSentProvider.notifier).state = value;
        });

        return null;
      },
      [],
    );
    final List<Widget> widgets = [
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: FittedBox(
            child: CupertinoSlidingSegmentedControl(
              thumbColor:
                  isMin ? CupertinoColors.tertiarySystemFill : kPrimaryColor,
              groupValue: segmentedValue,
              onValueChanged: (int? value) {
                ref.read(segmentedValueProvider.notifier).state = value!;
              },
              children: {
                0: GestureDetector(
                  onTap: () {
                    ref.read(segmentedValueProvider.notifier).state = 0;
                    if (isMin) {
                      ref.read(isDetailsMinimizedProvider.notifier).state =
                          false;
                    }
                  },
                  child: const FittedBox(
                    child: Text(
                      'Projects',
                      style: kTSSegmentedController,
                    ),
                  ),
                ),
                1: GestureDetector(
                  onTap: () {
                    ref.read(segmentedValueProvider.notifier).state = 1;
                    if (isMin) {
                      ref.read(isDetailsMinimizedProvider.notifier).state =
                          false;
                    }
                  },
                  child: const FittedBox(
                    child: Text(
                      'Route',
                      style: kTSSegmentedController,
                    ),
                  ),
                ),
                2: GestureDetector(
                  onTap: () {
                    ref.read(segmentedValueProvider.notifier).state = 2;
                    if (isMin) {
                      ref.read(isDetailsMinimizedProvider.notifier).state =
                          false;
                    }
                  },
                  child: const FittedBox(
                    child: Text(
                      'Contact',
                      style: kTSSegmentedController,
                    ),
                  ),
                ),
              },
            ),
          ),
        ),
      ),
      IndexedStack(
        alignment: Alignment.topCenter,
        index: selectIndex(isMin, segmentedValue, isFormSent),
        children: selectedWidget,
      ),
      // Center(
      //   child: AnimatedSwitcher(
      //     duration: duration,
      //     child: isMin
      //         ? selectedWidget[0]
      //         : (segmentedValue == 0)
      //             ? selectedWidget[1]
      //             : (segmentedValue == 1)
      //                 ? selectedWidget[2]
      //                 : isFormSent == false
      //                     ? selectedWidget[3]
      //                     : selectedWidget[4],
      //   ),
      // ),
    ];

    return Window(
      duration: duration,
      isMinProvider: isDetailsMinimizedProvider,
      child: CupertinoScrollbar(
        thumbVisibility: orientation == Orientation.landscape ? true : false,
        controller: scrollCTR,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.builder(
            controller: scrollCTR,
            physics: orientation == Orientation.portrait
                ? const NeverScrollableScrollPhysics()
                : const BouncingScrollPhysics(),
            shrinkWrap: orientation == Orientation.landscape ? false : true,
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int index) => widgets[index],
          ),
        ),
      ),
    );
  }
}

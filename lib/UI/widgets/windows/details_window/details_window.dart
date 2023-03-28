import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/providers/details_providers.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_providers.dart';
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
    useEffect(() {
      GetStorage().listenKey('form_sent', (value) {
        ref.read(isFormSentProvider.notifier).state = value;
      });
      return null;
    }, []);
    return Window(
        duration: duration,
        isMin: isDetailsMinimizedProvider,
        child: AnimatedSwitcher(
            duration: duration,
            child: isMin
                ? const FittedBox(
                    child: Text(
                      "ABOUT ME!",
                      style: kTSTitle,
                    ),
                  )
                : CupertinoScrollbar(
                    thumbVisibility:
                        orientation == Orientation.landscape ? true : false,
                    controller: scrollCTR,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView(
                        controller: scrollCTR,
                        physics: orientation == Orientation.portrait
                            ? const NeverScrollableScrollPhysics()
                            : null,
                        shrinkWrap:
                            orientation == Orientation.landscape ? false : true,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: CupertinoSlidingSegmentedControl(
                                  thumbColor: kPrimaryColor,
                                  groupValue: segmentedValue,
                                  children: const {
                                    0: Text(
                                      'Project',
                                      style: kTSSegmentedController,
                                    ),
                                    1: Text(
                                      'Experience',
                                      style: kTSSegmentedController,
                                    ),
                                    2: Text(
                                      'Contact',
                                      style: kTSSegmentedController,
                                    ),
                                  },
                                  onValueChanged: (v) {
                                    ref
                                        .read(segmentedValueProvider.notifier)
                                        .state = v!;
                                  }),
                            ),
                          ),
                          Center(
                            child: AnimatedSwitcher(
                              duration: duration,
                              child:
                                  (segmentedValue == 0 || segmentedValue == 1)
                                      ? const UnderConstructionWindow()
                                      : isFormSent == true
                                          ? const ContactFormSent()
                                          : const ContactMeWindow(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
  }
}

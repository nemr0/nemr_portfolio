import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_provider.dart';
import 'package:nemr_portfolio/UI/style/constants/colors.dart';
import 'package:nemr_portfolio/UI/style/constants/text_styles.dart';
import 'package:nemr_portfolio/UI/widgets/windows/window.dart';

class DetailsWindow extends HookConsumerWidget {
  const DetailsWindow({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMin = ref.watch(isDetailsMinimizedProvider);
    final segmentedValue = useState(2);
    return Window(
        isMin: isDetailsMinimizedProvider,
        child: isMin
            ? const FittedBox(
                child: Text(
                  "ABOUT ME!",
                  style: kTSName,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CupertinoSlidingSegmentedControl(
                      thumbColor: kPrimaryColor,
                      groupValue: segmentedValue.value,
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
                      onValueChanged: (v) {}
                      // segmentedValue.value = v!
                      ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      CupertinoTextField(),
                    ],
                  )
                ],
              ));
  }
}

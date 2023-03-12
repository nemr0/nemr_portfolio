import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nemr_portfolio/UI/providers/is_minimized_providers.dart';
import 'package:nemr_portfolio/UI/style/constants/colors.dart';
import 'package:nemr_portfolio/UI/style/constants/text_styles.dart';
import 'package:nemr_portfolio/UI/widgets/windows/window.dart';

import 'custom_cupertino_textfield.dart';

/// a window that separated with three Sliding Segmented Controls
/// "Project" , "Experience" and, "Contact"
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
                  style: kTSTitle,
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

                      // TODO: Uncomment bellow line after implementing Projects & Experience
                      // segmentedValue.value = v!
                      ),
                  if (segmentedValue.value == 2) const ContactMeWindow()
                ],
              ));
  }
}

class ContactMeWindow extends HookWidget {
  const ContactMeWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final emailCTR = useTextEditingController();

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        /// making it scrollable in landscape state
        if (orientation == Orientation.landscape) {
          return ListView(
            shrinkWrap: true,
            children: [
              CCTextField(
                placeholder: 'Email',
                controller: emailCTR,
                icon: CupertinoIcons.mail_solid,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        } else

        /// [Orientation.portrait]
        {
          /// as all widget is scrollable in portrait mode just
          /// wrapping in a column
          return Column(
            children: [
              CCTextField(
                placeholder: 'Email',
                controller: emailCTR,
                icon: CupertinoIcons.mail_solid,
                inputType: TextInputType.emailAddress,
              ),
            ],
          );
        }
      },
    );
  }
}

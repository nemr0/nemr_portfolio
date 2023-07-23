import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A Widget builder with given [Size] and [BuildContext] parameters
typedef SizedBuilder = Widget Function(BuildContext context, Size? size);

/// HookWidget with a builder that gives [Size] and [BuildContext] as parameters
class MeasureSize extends HookWidget {
  final SizedBuilder builder;

  const MeasureSize({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetKey = GlobalKey();

    final oldSize = useState<Size?>(null);
    void postFrameCallback(_) {
      var context = widgetKey.currentContext;
      if (context == null) return;
      var newSize = context.size;
      if (oldSize.value == newSize || newSize == null) return;
      oldSize.value = newSize;
    }

    useEffect(
      () {
        SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);

        return null;
      },
      [context],
    );

    return SizedBox(
      key: widgetKey,
      child: builder(context, oldSize.value),
    );
  }
}

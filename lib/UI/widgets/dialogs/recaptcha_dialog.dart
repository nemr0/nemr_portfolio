//ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlatformViewRegistry {
  static registerViewFactory(String viewId, dynamic cb) {
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewId, cb);
  }
}

class RecaptchaDialog extends HookWidget {
  const RecaptchaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdViewId = useState('map_element');
    useEffect(() {
      PlatformViewRegistry.registerViewFactory(
        createdViewId.value,
        (int viewId) => html.IFrameElement()
          ..src = '/assets/html/recaptcha.html'
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%',
      );
      html.window.onMessage.listen((html.MessageEvent msg) {
        // print();
        Navigator.of(context).pop<String>(msg.data);
      });
      return null;
    }, []);
    final orientation = MediaQuery.of(context).orientation;
    final double width = (orientation == Orientation.landscape)
        ? MediaQuery.of(context).size.width * .5
        : MediaQuery.of(context).size.width * .9;
    final double height = MediaQuery.of(context).size.height * .8;

    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: CupertinoColors.darkBackgroundGray.withOpacity(.5),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: HtmlElementView(
            viewType: createdViewId.value,
          ),
        ),
      ),
    );
  }
}

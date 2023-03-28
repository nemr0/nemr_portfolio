// //ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
// import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:slider_captcha/slider_capchar.dart';

class SliderCaptchaDialog extends HookWidget {
  const SliderCaptchaDialog(this.date, {Key? key}) : super(key: key);
  final String date;

  @override
  Widget build(BuildContext context) {
    final controller = useState(SliderController());
    final isLoading = useState(true);
    useEffect(() {
      if (isLoading.value == false) {
        controller.value.create.call();
      }
      return null;
    }, [isLoading.value]);
    changeLoadingState() async {
      await Future.delayed(const Duration(seconds: 1));
      isLoading.value = false;
    }

    return CupertinoAlertDialog(
      content: DefaultTextStyle(
        style: kTSAgreement,
        child: SliderCaptcha(
          controller: controller.value,
          space: 20,
          title: 'Are You A Robot? :\\',
          colorBar: kPrimaryColor,
          colorCaptChar: kPrimaryColor,
          image: Image.network('https://random.imagecdn.app/500/150?$date',
              fit: BoxFit.fitWidth,
              //     frameBuilder: (_, image, loadingBuilder, __) {
              //   if (loadingBuilder == null) {
              //     return const Center(
              //       child: CupertinoActivityIndicator(),
              //     );
              //   } else {
              //     return image;
              //   }
              // },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              changeLoadingState();

              return child;
            }
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }),
          onConfirm: (bool value) async {
            if (value) {
              Navigator.pop<bool>(context, value);
            } else {
              controller.value.create.call();
            }
          },
        ),
      ),
    );
  }
}
//
// class PlatformViewRegistry {
//   static registerViewFactory(String viewId, dynamic cb) {
//     // ignore:undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(viewId, cb);
//   }
// }
//
// class RecaptchaDialog extends HookWidget {
//   const RecaptchaDialog({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final createdViewId = useState('map_element');
//     useEffect(() {
//       PlatformViewRegistry.registerViewFactory(
//         createdViewId.value,
//         (int viewId) => html.IFrameElement()
//           ..src = '/assets/html/recaptcha.html'
//           ..style.border = 'none'
//           ..style.width = '100%'
//           ..style.height = '100%',
//       );
//       html.window.onMessage.listen((html.MessageEvent msg) {
//         // print();
//         Navigator.of(context).pop<String>(msg.data);
//       });
//       return null;
//     }, []);
//     final orientation = MediaQuery.of(context).orientation;
//     final double width = (orientation == Orientation.landscape)
//         ? MediaQuery.of(context).size.width * .5
//         : MediaQuery.of(context).size.width * .9;
//     final double height = MediaQuery.of(context).size.height * .8;
//
//     return Center(
//       child: Container(
//         height: height,
//         width: width,
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         child: Directionality(
//           textDirection: TextDirection.ltr,
//           child: HtmlElementView(
//             viewType: createdViewId.value,
//           ),
//         ),
//       ),
//     );
//   }
// }

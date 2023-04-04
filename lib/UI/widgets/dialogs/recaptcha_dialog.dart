//ignore_for_file:avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/UI/widgets/windows/details_window/conatct_sub_window/whatsapp_contact.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';

class ReCaptchaDialog extends HookWidget {
  const ReCaptchaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdViewId = useState('map_element');
    useEffect(() {
      // ignore:undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        createdViewId.value,
        (int viewId) => IFrameElement()
          ..style.height = '100%'
          ..style.width = '100%'
          ..src = '/assets/html/recaptcha.html'
          ..style.border = 'none',
      );
      window.onMessage.listen((msg) {
        Navigator.pop<String>(context, msg.data); //msg.data is captcha token
      });
      return null;
    }, []);
    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      child: GlassMorphism(
          color: kBgColor.withOpacity(.35),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: glassBoxDecoration(color: kBgColor.withOpacity(.35)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Please, Verify You\'re a HUMAN!',
                style: kTSAgreement,
              ),
              Container(
                height: 500,
                width: 400,
                // padding: EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                color: kGradientColor.withOpacity(.2),
                child: HtmlElementView(
                  viewType: createdViewId.value,
                ),
              ),
              const WhatsappContactWidget(
                text:
                    'If reCaptcha does not show up, then probably your platform is not supported but you can still contact me on Whatsapp :)',
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          )).animate().fadeIn(),
    );
    // final errorTimer = useState<int>(0);
    // final usedDate =
    //     useState<String>(DateTime.now().millisecondsSinceEpoch.toString());
    // final controller = useState<SliderController>(SliderController());
    // final isLoading = useState<bool>(true);
    // useEffect(() {
    //   if (isLoading.value == false) {
    //     Future.delayed(const Duration(milliseconds: 200))
    //         .then((value) => controller.value.create.call());
    //   }
    //   return null;
    // }, [isLoading.value]);
    // changeLoadingValue(bool isItLoading) => Future.delayed(Duration.zero)
    //     .then((value) => isLoading.value = isItLoading);
    //   DefaultTextStyle(
    //     style: kTSAgreement,
    //     child: Stack(
    //       children: [
    //         Center(
    //           child: SliderCaptcha(
    //             controller: controller.value,
    //             title: 'Are You A Robot? :\\',
    //             imageToBarPadding: 10,
    //             colorBar: kPrimaryColor,
    //             colorCaptChar: kPrimaryColor,
    //             image: Image.network(
    //                 'https://random.imagecdn.app/500/150?${usedDate.value}',
    //                 fit: BoxFit.fitWidth, loadingBuilder: (BuildContext context,
    //                     Widget child, ImageChunkEvent? loadingProgress) {
    //               if (loadingProgress == null) {
    //                 changeLoadingValue(false);
    //                 return child;
    //               }
    //               changeLoadingValue(true);
    //               return Image.asset('background.png');
    //             }),
    //             onConfirm: (bool value) async {
    //               if (value) {
    //                 Navigator.pop<bool>(context, value);
    //               } else {
    //                 errorTimer.value++;
    //                 if (errorTimer.value < 4) {
    //                   usedDate.value =
    //                       DateTime.now().millisecondsSinceEpoch.toString();
    //                 } else {
    //                   Navigator.pop<bool>(context, value);
    //                 }
    //               }
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

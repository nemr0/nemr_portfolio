//ignore_for_file:avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui_web' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nemr_portfolio/UI/widgets/glass_morphism.dart';
import 'package:nemr_portfolio/UI/widgets/buttons/text_by_icon_button.dart';
import 'package:nemr_portfolio/config/colors.dart';
import 'package:nemr_portfolio/config/text_styles.dart';
import 'package:nemr_portfolio/generated/assets.dart';

class ReCaptchaDialog extends HookWidget {
  const ReCaptchaDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createdViewId = useState('map_element');
    useEffect(
      () {
        // ignore:undefined_prefixed_name
        ui.platformViewRegistry.registerViewFactory(
          createdViewId.value,
          (int viewId) => IFrameElement()
            ..style.height = '100%'
            ..style.width = '100%'
            ..src = '/${Assets.htmlRecaptcha}'
            ..style.border = 'none',
        );
        window.onMessage.listen((msg) {
          Navigator.pop<String>(context, msg.data); //msg.data is captcha token
        });

        return null;
      },
      [],
    );

    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      child: GlassMorphism(
        height: double.infinity,
        width: double.infinity,
        color: kBgColor.withOpacity(.35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Text(
                'Please, Verify You\'re a HUMAN!',
                style: kTSAgreement,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: 500,
                width: 400,
                // padding: EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                color: kGradientColor.withOpacity(.2),
                child: HtmlElementView(
                  viewType: createdViewId.value,
                ),
              ),
            ),
            const Expanded(
              child: TextByIconButton(
                text:
                    'If reCaptcha does not show up, then probably your platform is not supported but you can still contact me on Whatsapp :)',
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

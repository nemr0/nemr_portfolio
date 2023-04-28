import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nemr_portfolio/UI/helpers/show_error_dialog.dart';
import 'package:nemr_portfolio/UI/widgets/dialogs/recaptcha_dialog.dart';
import 'package:nemr_portfolio/model/send_mail.dart';

// Future<void> testGet() async {
//   GetStorage get = GetStorage();
//   await get.write('form_sent', true);
// }
// testSliderRecaptcha(BuildContext context) async {
//   await showCupertinoDialog(
//           barrierDismissible: true,
//           context: context,
//           builder: (context) => SliderCaptchaDialog(
//               DateTime.now().millisecondsSinceEpoch.toString()))
//       .then((value) => print(value));
// }
// testSliderCaptcha(BuildContext context) async =>
//     print(await showCupertinoDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (context) => const ReCaptchaDialog()));
// ignore_for_file: use_build_context_synchronously
onSubmit(
  BuildContext context,
  String company,
  String name,
  String email,
  String phone,
  String desc,
) async {
  String? reCaptchaToken = await showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => const ReCaptchaDialog(),
  );
  if (reCaptchaToken == null) {
    showErrorDialog(context, 'I guess You\'re a Robot :(');

    return;
  }
  GetStorage get = GetStorage();
  SendMail mailer = SendMail()..init();
  try {
    await mailer.welcome(name, email, reCaptchaToken);
    await mailer.info(name, company, email, phone, desc);

    get.write('form_sent', true);
  } on EmailJSResponseStatus catch (e, _) {
    get.write('form_sent', false);
    showErrorDialog(context, e.text);
  }

  // } catch (e) {
  //   print('GivenError:$e');

  //   get.write('form_sent', false);
  // }
}

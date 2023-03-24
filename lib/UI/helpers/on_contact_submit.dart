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

// ignore_for_file: use_build_context_synchronously
onSubmit(BuildContext context, String company, String name, String email,
    String phone, String desc) async {
  GetStorage get = GetStorage();
  String recaptchaResponse = await showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const RecaptchaDialog());
  SendMail mailer = SendMail()..init();
  try {
    await mailer.welcome(name, email, recaptchaResponse);
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

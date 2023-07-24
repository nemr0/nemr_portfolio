import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nemr_portfolio/UI/helper/show_error_dialog.dart';
import 'package:nemr_portfolio/UI/widgets/dialogs/recaptcha_dialog.dart';
import 'package:nemr_portfolio/model/send_mail.dart';

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
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => showErrorDialog(context, 'I guess You\'re a Robot :('),
    );

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
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => showErrorDialog(context, e.text));
  }
}

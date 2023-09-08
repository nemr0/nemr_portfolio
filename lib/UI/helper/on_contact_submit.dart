import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nemr_portfolio/UI/helper/show_error_dialog.dart';
import 'package:nemr_portfolio/UI/widgets/dialogs/recaptcha_dialog.dart';
import 'package:nemr_portfolio/model/send_mail.dart';

import '../start_point.dart';

Future<void> onSubmit(
  // WidgetRef ref,
  String company,
  String name,
  String phone,
  String email,
  String desc,
) async {
  String? reCaptchaToken = await showCupertinoDialog(
    barrierDismissible: true,
    context: scaffoldKey.currentContext!,
    builder: (context) => const ReCaptchaDialog(),
  );
  if (reCaptchaToken == null) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => showErrorDialog(
          scaffoldKey.currentContext!, 'I guess You\'re a Robot :('),
    );

    return;
  }
  GetStorage get = GetStorage();
  SendMail mailer = SendMail();

  /// sending two mails together
  List<EmailJSResponseStatus> emails = await Future.wait([
    mailer.welcome(name, email, reCaptchaToken),
    mailer.info(name, company, email, phone, desc)
  ]);

  /// on success
  if (emails.first.status == 200 && emails.last.status == 200) {
    /// save to local storage
    get.write('form_sent', true);

    /// change state
    // ref.read(isFormSentProvider.notifier).state = true;
  }

  /// on error
  else {
    /// save to local storage
    get.write('form_sent', false);

    /// change state
    // ref.read(isFormSentProvider.notifier).state = false;

    /// get error
    String err;
    if (emails.first.status != 200) {
      err = emails.first.toString();
    } else {
      err = emails.last.toString();
    }

    /// show error
    SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) => showErrorDialog(scaffoldKey.currentContext!, err));
  }
  return;
}

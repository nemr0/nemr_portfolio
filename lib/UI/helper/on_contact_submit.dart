import 'package:emailjs/emailjs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nemr_portfolio/UI/helper/show_error_dialog.dart';
import 'package:nemr_portfolio/UI/widgets/dialogs/recaptcha_dialog.dart';
import 'package:nemr_portfolio/model/send_mail.dart';


Future<void> onSubmit(
  BuildContext context,
  String company,
  String name,
  String phone,
  String email,
  String desc,
) async {
  String? reCaptchaToken = await showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => const ReCaptchaDialog(),
  );
  if (reCaptchaToken == null) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) => showErrorDialog(
          context, 'I guess You\'re a Robot :('),
    );

    return;
  }
  GetStorage get = GetStorage();
  SendMail mailer = SendMail();
try{
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


    /// show error
    SchedulerBinding.instance.addPostFrameCallback(
        (timeStamp) => showErrorDialog(context, 'An Error Happened, Please Try Again Later!'));
  }
}
catch (e){

  /// show error
  /// show error
  SchedulerBinding.instance.addPostFrameCallback(
          (timeStamp) => showErrorDialog(context, 'An Error Happened, Please Try Again Later!'));
}
  return;
}

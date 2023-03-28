import 'package:emailjs/emailjs.dart';
import '../config/dot_env_vars.dart';
import '../config/welcome_template.dart';

class SendMail {
  init() => EmailJS.init(
        Options(
            privateKey: DotEnvVars.emailJSPrivateKey,
            publicKey: DotEnvVars.emailJSPublicKey),
      );

  Future<EmailJSResponseStatus> welcome(
    String name,
    String toEmail,
  ) async =>
      await EmailJS.send(DotEnvVars.emailJSServiceID, 'welcome_email', {
        'name': name,
        'content': htmlWelcomeTemplate(name),
        'to': toEmail,
        // 'g-recaptcha-response': reCaptchaToken,
      });
  // await SendgridService.mailer.send(email);
  // return true;

  Future<EmailJSResponseStatus> info(String name, String company, String email,
          String phone, String desc) async =>
      await EmailJS.send(
        DotEnvVars.emailJSServiceID,
        'contact_form_info',
        {
          'name': name,
          'to': 'omarelnemr8@gmail.com',
          'company': company,
          'email': email,
          'phone': phone,
          'desc': desc,
        },
      );
}

import 'package:emailjs/emailjs.dart';
import '../config/environment_variables.dart';
import '../config/welcome_template.dart';

class SendMail {
  init() => EmailJS.init(
        const Options(
            privateKey: EnvironmentVariables.emailJSPrivateKey,
            publicKey: EnvironmentVariables.emailJSPublicKey),
      );

  Future<EmailJSResponseStatus> welcome(
          String name, String toEmail, String reCaptchaToken) async =>
      await EmailJS.send(
          EnvironmentVariables.emailJSServiceID, 'welcome_email', {
        'name': name,
        'content': htmlWelcomeTemplate(name),
        'to': toEmail,
        'g-recaptcha-response': reCaptchaToken,
      });
  // await SendgridService.mailer.send(email);
  // return true;

  Future<EmailJSResponseStatus> info(String name, String company, String email,
          String phone, String desc) async =>
      await EmailJS.send(
        EnvironmentVariables.emailJSServiceID,
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

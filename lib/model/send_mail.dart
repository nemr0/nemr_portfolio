import 'package:emailjs/emailjs.dart';
import 'package:flutter/foundation.dart';
import '../config/dot_env_vars.dart';
import '../config/welcome_template.dart';

Future<bool> sendMail({
  required String to,
  required String name,
}) async {
  try {
    EmailJS.send(
        DotEnvVars.emailJSServiceID,
        DotEnvVars.emailJSTemplateID,
        {'name': 'name', 'content': htmlWelcomeTemplate(name), 'to': to},
        Options(
            privateKey: DotEnvVars.emailJSPrivateKey,
            publicKey: DotEnvVars.emailJSPublicKey));
    // await SendgridService.mailer.send(email);
    return true;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

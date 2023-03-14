import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvVars {
  static String recaptchaSiteKey = dotenv.get('RECAPTCHASITEKEY');
  static String recaptchaSecret = dotenv.get('RECAPTCHASECRET');
  static String emailJSPublicKey = dotenv.get('EMAILJSPUBLICKEY');
  static String emailJSPrivateKey = dotenv.get('EMAILJSPRIVATEKEY');
  static String emailJSServiceID = dotenv.get('EMAILJSSERVICEID');
  static String emailJSTemplateID = dotenv.get('EMAILJSWELCOMETEMPLATEID');
}

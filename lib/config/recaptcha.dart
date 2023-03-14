import 'package:flutter_dotenv/flutter_dotenv.dart';

/// A Configuration Class that holds the `Google reCAPTCHA v3` API Confidential Information.
class Config {
  /// Prevents from object instantiation.
  Config._();

  /// Holds the 'Site Key' for the `Google reCAPTCHA v3` API .
  static String siteKey = dotenv.get('RECAPTCHASITEKEY');

  /// Holds the 'Secret Key' for the `Google reCAPTCHA v3` API .
  static String secretKey = dotenv.get('RECAPTCHASECRET');

  /// Holds the 'Verfication URL' for the `Google reCAPTCHA v3` API .
  static final verificationURL =
      Uri.parse('https://www.google.com/recaptcha/api/siteverify');
}

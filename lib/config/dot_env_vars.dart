import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvVars {
  static String emailJSPublicKey = dotenv.get('EMAILJSPUBLICKEY');
  static String emailJSPrivateKey = dotenv.get('EMAILJSPRIVATEKEY');
  static String emailJSServiceID = dotenv.get('EMAILJSSERVICEID');
}

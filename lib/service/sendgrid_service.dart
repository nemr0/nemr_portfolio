import 'package:flutter_dotenv/flutter_dotenv.dart';

class SendgridService {
  SendgridService._();
  static String apiKey = dotenv.get('SENDGRIDAPI');
}

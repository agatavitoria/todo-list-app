import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppVars {
  static String get apiUrl => dotenv.get('API_URL', fallback: null);
}
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String get apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';
  static String ApiUrl_java = 'https://stargazer-wgpb.onrender.com/';
  static String ApiUrl_python = 'http://16.176.9.134:5000/';
  static String ApiLLM = '${ApiUrl_python}/api/chat';
  static String ApiPalmline= '${ApiUrl_python}predict';
  static const String baseUrl = 'https://generativelanguage.googleapis.com';
  static const String model = 'gemini-pro';
  static const Duration timeout = Duration(seconds: 30);
  static final String loginUrl = '${ApiUrl_java}login';
  static final String registerUrl = '${ApiUrl_java}sign-up';
  static final String logoutUrl = '${ApiUrl_java}logout';
  static final String deleteUserUrl = '${ApiUrl_java}deleteUser';
  static final String changepasswordUrl = '${ApiUrl_java}change_password';
  static final String addReview = '${ApiUrl_java}add_review';
}

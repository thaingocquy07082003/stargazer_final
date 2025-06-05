import 'package:dio/dio.dart';
import 'package:stargazer/core/constants/api_constants.dart';

class RegisterEmail {
  static Future<bool> signup(String name, String email, String password) async {
    try {
      final response = await Dio().post(
        ApiConstants.registerUrl,
        data: {
          'fullName': name,
          'email': email,
          'password': password,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Lỗi đăng ký : $e');
      return false;
    }
  }
}

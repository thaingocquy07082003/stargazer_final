import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stargazer/core/constants/api_constants.dart';
import 'package:stargazer/core/services/data/models/user.dart';

abstract class LoginDataSource {
  Future<Map<String, dynamic>> loginWithEmail(String email, String password);
  Future<Map<String, dynamic>> loginWithGoogle(String token);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<Map<String, dynamic>> loginWithEmail(
      String email, String password) async {
    try {
      final dio = Dio();
      dio.options.validateStatus = (status) {
        return status != null && status < 500;
      };

      final response = await dio.post(
        ApiConstants.loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      print('Login response: ${response.data}'); // Debug log

      if (response.statusCode == 200) {
        final data = response.data["data"];
        if (data == null) {
          return {'user': null, 'message': 'Dữ liệu người dùng không hợp lệ'};
        }

        try {
          final user = UserInfo(
            id: data['id']?.toString() ?? '',
            name: data['fullName'] ?? 'No Name',
            email: data['email'] ?? '',
            token: data['token'] ?? '',
            role: data['role'] ?? 'user',
          );

          return {'user': user, 'message': response.data["message"] ?? ''};
        } catch (e) {
          print('Error parsing user data: $e');
          return {'user': null, 'message': 'Dữ liệu người dùng không hợp lệ'};
        }
      }

      // Handle specific status codes
      if (response.statusCode == 403) {
        return {'user': null, 'message': 'Tài khoản chưa được kích hoạt'};
      }
      if (response.statusCode == 404) {
        return {'user': null, 'message': 'Tài khoản không tồn tại'};
      }
      if (response.statusCode == 401) {
        return {'user': null, 'message': 'Mật khẩu không chính xác'};
      }

      // Handle unexpected status codes
      return {
        'user': null,
        'message': response.data["message"] ?? 'Đăng nhập thất bại'
      };
    } catch (e) {
      print('Login error: $e');
      return {'user': null, 'message': 'Đã xảy ra lỗi. Vui lòng thử lại sau.'};
    }
  }
  
  @override
  Future<Map<String, dynamic>> loginWithGoogle(String token) async {
    try {
      final dio = Dio();
      dio.options.validateStatus = (status) {
        return status != null && status < 500;
      };

      final response = await dio.post(
        ApiConstants.loginGoogle,
        data: {
          'token': token,
        },
      );

      print('Login response: ${response.data}'); // Debug log

      if (response.statusCode == 200) {
        final data = response.data["data"];
        if (data == null) {
          return {'user': null, 'message': 'Dữ liệu người dùng không hợp lệ'};
        }

        try {
          final user = UserInfo(
            id: data['id']?.toString() ?? '',
            name: data['fullName'] ?? 'No Name',
            email: data['email'] ?? '',
            token: data['token'] ?? '',
            role: data['role'] ?? 'user',
          );

          return {'user': user, 'message': response.data["message"] ?? ''};
        } catch (e) {
          print('Error parsing user data: $e');
          return {'user': null, 'message': 'Dữ liệu người dùng không hợp lệ'};
        }
      }

      // Handle unexpected status codes
      return {
        'user': null,
        'message': response.data["message"] ?? 'Đăng nhập thất bại'
      };
    } catch (e) {
      print('Login error: $e');
      return {'user': null, 'message': 'Đã xảy ra lỗi. Vui lòng thử lại sau.'};
    }
  }
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}

class InvalidPasswordException implements Exception {
  final String message;
  InvalidPasswordException(this.message);
}

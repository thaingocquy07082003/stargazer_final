import 'package:dio/dio.dart';
import 'package:stargazer/core/constants/api_constants.dart';
import 'package:stargazer/core/services/data/models/user.dart';

abstract class LoginDataSource {
  Future<UserInfo?> loginWithEmail(String email, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<UserInfo?> loginWithEmail(String email, String password) async {
    try {
      final response = await Dio().post(
        ApiConstants.loginUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data["data"];
        print('nhận được data : $data');
        return UserInfo(
          id: data['id'].toString(),
          name: data['fullName'],
          email: data['email'],
          token: data['token'],
          role: data['role'],
        );
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

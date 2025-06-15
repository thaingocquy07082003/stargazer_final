import 'package:stargazer/core/services/data/models/user.dart';

abstract class LoginRepository {
  Future<UserInfo?> getUser();
  Future<Map<String, dynamic>> LoginEmail(String email, String password);
}

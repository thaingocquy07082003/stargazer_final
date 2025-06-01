import 'package:stargazer/core/services/data/models/user.dart';

abstract class LoginRepository {
  Future<UserInfo?> getUser();
  Future<UserInfo?> LoginEmail(String email, String password);
}

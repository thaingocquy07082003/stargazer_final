import 'package:shared_preferences/shared_preferences.dart';
import 'package:stargazer/core/services/data/repositories/login-register_repository.dart';

class LoginRegisterLocalDatasource implements LoginRegisterRepository {
  @override
  Future<void> saveUser(String token,String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('name', name);
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('name');
    await prefs.setBool('isLoggedIn', false);
  }
}

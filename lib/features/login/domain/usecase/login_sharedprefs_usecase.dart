import 'package:shared_preferences/shared_preferences.dart';
import 'package:stargazer/core/services/data/models/user.dart';
import 'package:stargazer/features/login/domain/repositories/login_repository.dart';

class LoginSharedPrefsUsecase {
  final LoginRepository loginRepository;

  LoginSharedPrefsUsecase({
    required this.loginRepository,
  });

  Future<UserInfo?> call() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isLoggedIn') == true && prefs.getString('id') != null) {
      return loginRepository.getUser();
    }
    return null;
  }
}

// import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:stargazer/features/login/data/repositories/login_repository_impl.dart';
// import 'package:stargazer/features/login/domain/repositories/login_repository.dart';

class LoginEmailUsecase {
  final LoginRepositoryImpl loginRepository;
  // final FirebaseAuth auth;

  LoginEmailUsecase({
    required this.loginRepository,
    // FirebaseAuth? auth,
  });

  Future<Map<String, dynamic>> call(String email, String password) async {
    return await loginRepository.LoginEmail(email, password);
  }
}

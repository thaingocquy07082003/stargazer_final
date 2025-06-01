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

  Future<String> call(String email, String password) async {
    final user = await loginRepository.LoginEmail(email, password);
    return user?.id ?? 'none';
  }
}

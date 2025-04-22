// import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:stargazer/features/login/domain/repositories/login_repository.dart';

class LoginEmailUsecase {
  final LoginRepository loginRepository;
  // final FirebaseAuth auth;

  LoginEmailUsecase({
    required this.loginRepository,
    // FirebaseAuth? auth,
  });

  Future<String> call(String email, String password) async {
    // await auth.signInWithEmailAndPassword(
    //   email: email,
    //   password: password,
    // );
    return '007';
  }
}

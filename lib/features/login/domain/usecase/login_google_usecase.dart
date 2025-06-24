// import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stargazer/core/services/data/datasources/remote/login_datasource.dart';
// import 'package:stargazer/core/services/domain/entities/user.dart';
import 'package:stargazer/features/login/domain/repositories/login_repository.dart';
import 'package:stargazer/features/login/domain/usecase/google_sign_in.dart';

class LoginGoogleUsecase {
  final LoginRepository loginRepository;
  // final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  LoginGoogleUsecase({
    required this.loginRepository,
    // FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
  }) : this.googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<Map<String, dynamic>> call() async {
    final GoogleSignInProvider _googleSignIn = GoogleSignInProvider();
    String? _accessToken;
    final GoogleSignInAccount? user = await _googleSignIn.signInWithGoogle();
    final GoogleSignInAuthentication? googleAuth = await user?.authentication;
    _accessToken = googleAuth?.accessToken;
    print('access token from google : $_accessToken');
    _googleSignIn.signOutGoogle();
    return LoginDataSourceImpl().loginWithGoogle(_accessToken!);
  }
}

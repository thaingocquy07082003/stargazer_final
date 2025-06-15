// import 'package:stargazer/core/services/data/models/model.dart';
// import 'package:stargazer/core/services/data/services/firebase_reference.dart';
// import 'package:stargazer/core/services/domain/entities/user.dart';
import 'package:stargazer/core/services/data/datasources/remote/login_datasource.dart';
import 'package:stargazer/core/services/data/datasources/remote/user_remote_datasource.dart';
import 'package:stargazer/core/services/data/models/user.dart';
import 'package:stargazer/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  // final FirebaseReference firebaseReference;

  LoginRepositoryImpl();

  @override
  Future<UserInfo?> getUser() async {
    try {
      final user = await UserRemoteDataSourceImpl().getUser();
      return user;
    } catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> LoginEmail(String email, String password) async {
    try {
      return await LoginDataSourceImpl().loginWithEmail(email, password);
    } catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
}

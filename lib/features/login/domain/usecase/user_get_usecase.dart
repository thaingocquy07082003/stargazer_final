import 'package:stargazer/core/services/data/models/user.dart';
import 'package:stargazer/features/login/domain/repositories/login_repository.dart';

class UserGetUsecase {
  final LoginRepository loginRepository;

  UserGetUsecase({required this.loginRepository});

  Future<UserInfo?> call() async {
    return loginRepository.getUser();
  }
}

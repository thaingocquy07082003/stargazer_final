// import 'package:stargazer/core/services/domain/entities/user.dart';
import 'package:stargazer/core/services/data/models/user.dart';
import 'package:stargazer/core/services/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  Future<UserInfo?> call() async {
    return userRepository.getUser();
  }
}

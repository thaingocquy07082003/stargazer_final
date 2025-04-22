import 'package:stargazer/features/register/domain/respitories/register_repository.dart';

class UserCreateUsecase {
  final RegisterRepository registerRepository;

  UserCreateUsecase({required this.registerRepository});

  Future<void> call(String uid, String email, String name) async {
  }
}

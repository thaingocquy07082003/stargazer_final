import 'package:stargazer/core/services/data/models/user.dart';
import 'package:stargazer/core/services/domain/entities/user.dart';

abstract class UserRepository {
  Future<UserInfo?> getUser();
  Future<User> addUser(User user);
}

abstract class LoginRegisterRepository {
  Future<void> saveUser(String token,String name);
  Future<void> removeUser();
}

abstract class LoginRegisterRepository {
  Future<void> saveUser(String token,String name,String email);
  Future<void> removeUser();
}

import 'package:stargazer/core/services/data/datasources/local/login-register_local_datasource.dart';

class SaveSharedPrefsUsecase {
  SaveSharedPrefsUsecase();

  Future<void> call(String token,String name,String email) async {
    return await LoginRegisterLocalDatasource().saveUser(token,name,email);
  }
}

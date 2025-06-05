import 'package:stargazer/core/services/data/datasources/local/login-register_local_datasource.dart';

class SaveSharedPrefsUsecase {
  SaveSharedPrefsUsecase();

  Future<void> call(String token,String name) async {
    return await LoginRegisterLocalDatasource().saveUser(token,name);
  }
}

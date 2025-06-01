import 'package:stargazer/core/services/data/datasources/local/home_local_datasource.dart';
import 'package:stargazer/core/services/data/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stargazer/core/services/data/models/user.dart';


abstract class UserRemoteDataSource {
  Future<UserInfo?> getUser();
  Future<UserModel> addUser(UserModel user);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<UserInfo?> getUser() async {
    final user = await getUserLocal();
    return user;
  }

  @override
  Future<UserModel> addUser(UserModel user) async {
    await addUserFirestore(user);
    return user;
  }
}

Future<UserInfo?> getUserLocal() async {
  String name = await HomeLocalDatasource().GetUserName();
  String email = await HomeLocalDatasource().GetUserEmail();
  String id = await HomeLocalDatasource().GetUserId();
  String role = await HomeLocalDatasource().GetUserRole();
  String token = await HomeLocalDatasource().GetAccessToken();
  return UserInfo(id: id, name: name, email: email, role: role, token: token);
}

Future<void> addUserFirestore(UserModel user) async {
  final userDoc = FirebaseFirestore.instance.collection('users').doc(user.id);
  await userDoc.set(user.toJson());
}

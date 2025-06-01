import 'package:shared_preferences/shared_preferences.dart';

class HomeLocalDatasource {
  Future<String> GetAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
  Future<String> GetUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role') ?? '';
  }
  Future<String> GetUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? '';
  }
  Future<String> GetUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email') ?? '';
  }
  Future<String> GetUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id') ?? '';
  }
}
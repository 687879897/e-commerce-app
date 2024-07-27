import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user-data.dart';

@singleton
class SharedPreference {
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<void> saveUserData(UserData userData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", userData.email);
    await prefs.setString("name", userData.name);
    await prefs.setString("phone", userData.phone);
    await prefs.setString("password", userData.passsword);
  }

  Future<UserData?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    String? name = prefs.getString("name");
    String? phone = prefs.getString("phone");
    String? password = prefs.getString("password");

    if (email != null && name != null && phone != null && password != null) {
      return UserData(
        email: email,
        name: name,
        passsword: password,
        phone: phone,
      );
    }
    return null;
  }
}

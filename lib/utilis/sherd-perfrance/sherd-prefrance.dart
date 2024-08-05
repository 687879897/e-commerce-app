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

  Future<void> saveUserData(UserData user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", user.name);
    await prefs.setString("phone", user.phone);
    await prefs.setString("email", user.email);
    await prefs.setString("password", user.passsword);
  }

  Future<UserData?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final name = prefs.getString("name");
    final phone = prefs.getString("phone");
    final email = prefs.getString("email");
    final password = prefs.getString("password");

    if (name != null && phone != null && email != null && password != null) {
      return UserData(
        name: name,
        phone: phone,
        email: email,
        passsword: password,
      );
    }
    return null;
  }
}

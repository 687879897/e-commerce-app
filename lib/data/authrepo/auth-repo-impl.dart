import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/utils/constants.dart';
import '../../utilis/sherd-perfrance/sherd-prefrance.dart';
import 'auth-repo.dart';
import 'authremotdatasource/auth-remot-data-source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final InternetConnectionChecker internetConnectionChecker;
  final AuthRemotDataSource authRemotDataSource;
  final SharedPreference sharedPreference;

  AuthRepoImpl(this.internetConnectionChecker, this.authRemotDataSource, this.sharedPreference);

  @override
  Future<void> login(String email, String password) async {
    if (await internetConnectionChecker.hasConnection) {
      String token = await authRemotDataSource.login(email, password);
      await sharedPreference.saveToken(token);
    } else {
      throw Constants.internetErrorMessage;
    }
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String username,
    required String phonenumber,
  }) async {
    if (await internetConnectionChecker.hasConnection) {
      String token = await authRemotDataSource.register(
        phonenumber: phonenumber,
        username: username,
        email: email,
        password: password,
      );
      await sharedPreference.saveToken(token);
    } else {
      throw Constants.internetErrorMessage;
    }
  }
}

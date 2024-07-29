import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../ui/utils/constants.dart';
import 'auth-repo.dart';
import 'authremotdatasource/auth-remot-data-source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  InternetConnectionChecker internetConnectionChecker;
  AuthRemotDataSource authRemotDataSource;

  AuthRepoImpl(this.internetConnectionChecker, this.authRemotDataSource);

  @override
  Future login(String email, String password) async {
    if (await internetConnectionChecker.hasConnection) {
      await authRemotDataSource.login(email, password);
    }
    else {
      throw Constants.internetErrorMessage;
    }
  }

  @override
  Future register(
      {required String email, required String password, required String username, required String phonenumber}) async {
    if (await internetConnectionChecker.hasConnection) {
      await authRemotDataSource.register(phonenumber: phonenumber,
          username: username,
          email: email,
          password: password);
    }
    else {
      throw Constants.internetErrorMessage;
    }
  }
}
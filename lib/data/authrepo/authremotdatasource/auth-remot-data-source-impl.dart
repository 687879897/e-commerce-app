 import 'dart:convert';


import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../../model/auth-response.dart';
import '../../../ui/utils/constants.dart';
import '../../../ui/utils/end_points.dart';
import '../../../utilis/sherd-perfrance/sherd-prefrance.dart';
import 'auth-remot-data-source.dart';
@Injectable(as: AuthRemotDataSource)
class AuthRemotDataSourceImpl extends AuthRemotDataSource{
  SharedPreference sherdPrefrance;
  AuthRemotDataSourceImpl(this.sherdPrefrance);
  @override
  Future login(String email, String password) async{
    Uri uri=Uri.parse(EndPoints.login);
    final body={
      "email":"$email",
      "password":"$password"
    };
    Response response= await post(uri,body:body );
    AuthResponse authResponse=AuthResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode>=200&&response.statusCode<300&&authResponse!=null){
      sherdPrefrance.saveToken(authResponse.token!);
      return;
    }
    else{
      throw authResponse.statusMsg??Constants.defaultErrorMessage;

    }
  }

  @override
  Future register({required String email, required String password, required String username, required String phonenumber}) async{
    Uri uri=Uri.parse(EndPoints.register);
    final body={
      "name": username,
      "email":email,
      "password":password,
      "rePassword":password,
      "phone":phonenumber
    };
    Response response= await post(uri,body:body );
    AuthResponse authResponse=AuthResponse.fromJson(jsonDecode(response.body));
    if(response.statusCode>=200&&response.statusCode<300){
      sherdPrefrance.saveToken(authResponse.token!);

      return;}
    else{
      throw authResponse.statusMsg??Constants.defaultErrorMessage;

    }
}
}

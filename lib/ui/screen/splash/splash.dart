import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di.dart';
import '../../../utilis/sherd-perfrance/sherd-prefrance.dart';
import '../auth/login/login.dart';
import '../mian/main.dart';


class Splash extends StatelessWidget {
  static const String routeName = 'splash';
  final SharedPreference sharedPreference = getIt();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () async {
      String? token = await sharedPreference.getToken();
      if (token != null) {
        Navigator.pushReplacementNamed(context, Main.routeName);
      } else {
        Navigator.pushReplacementNamed(context, Login.routeName);
      }
    });

    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

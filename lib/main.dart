import 'package:flutter/material.dart';

import 'di.dart';
import 'ui/screen/auth/login/login.dart';
import 'ui/screen/auth/register/Register.dart';
import 'ui/screen/mian/main.dart';
import 'ui/screen/mian/tabs/home/proudect-detials/proudect-details.dart';
import 'ui/screen/splash/splash.dart';
import 'ui/utils/app_theme.dart';


void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        SplashScreen.routeName:(_)=>SplashScreen(),
        Login.routeName: (_) => Login(),
        Register.routeName: (_) => Register(),
        Main.routeName: (_) => Main(),
        ProductDetails.routeName:(_)=>ProductDetails()

      },
      initialRoute: SplashScreen.routeName,

    );
  }
}
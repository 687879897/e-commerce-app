import 'package:flutter/material.dart';
import '../../../di.dart';
import '../../../utilis/sherd-perfrance/sherd-prefrance.dart';
import '../../utils/app_assets.dart';
import '../auth/login/login.dart';
import '../mian/main.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 1), () async {
      SharedPreference sharedPreference = getIt();
      String? token = await sharedPreference.getToken();

      if (token == null) {
        Navigator.pushReplacementNamed(context, Login.routeName);
      } else {
        Navigator.pushReplacementNamed(context, Main.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppAssets.splash,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
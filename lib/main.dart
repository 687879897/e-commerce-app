import 'package:e_commerce_friday_c9/ui/screen/cartscreen/cart-screen.dart';
import 'package:e_commerce_friday_c9/ui/screen/proudect-detials/proudect-details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'di.dart';
import 'ui/screen/auth/login/login.dart';
import 'ui/screen/auth/register/register.dart';
import 'ui/screen/mian/main.dart';
import 'ui/screen/splash/splash.dart';

import 'ui/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDFOaRG9gm5pNGKGL9pB8sLBzsrm07ZcZI",
      appId: "e-commerce-4b3cc",
      messagingSenderId: "e-commerce-4b3cc",
      projectId: "e-commerce-4b3cc",
    ),
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        Login.routeName: (_) => Login(),
        Register.routeName: (_) => Register(),
        Main.routeName: (_) => Main(),
        ProductDetails.routeName: (_) => ProductDetails(),
        CartTab.routeName:(_)=>CartTab(),

      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

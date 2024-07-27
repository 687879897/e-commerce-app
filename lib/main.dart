
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart';
import 'ui/screen/auth/login/login.dart';
import 'ui/screen/auth/register/Register.dart';
import 'ui/screen/mian/main.dart';
import 'ui/screen/splash/splash.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.routeName,
        routes: {
          Splash.routeName: (context) => Splash(),
          Login.routeName: (context) => Login(),
          Register.routeName: (context) => Register(),
          Main.routeName: (context) => Main(),
        },
      ),
    );
  }
}

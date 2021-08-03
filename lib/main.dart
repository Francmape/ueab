import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/authentication/login_screen.dart';
import './screens/home/home_screen_base.dart';
import './screens/index.dart';
import './screens/onboard/splash_screen.dart';
import './helpers/custom_route.dart';
import './providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: Consumer<AuthProvider>(
        builder: (context, authData, _) => MaterialApp(
          theme: ThemeData(
            primarySwatch: colorCustom,
            backgroundColor: Colors.green,
            appBarTheme: AppBarTheme(
                color: Colors.transparent,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
                centerTitle: true,
                // elevation: 0.0,
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageFadeTransitionBuilder(),
                TargetPlatform.iOS: CustomPageFadeTransitionBuilder(),
              },
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const SplashScreen(),
          routes: {
            IndexScreen.routeName: (context) => const IndexScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            HomeBaseScreen.routeName: (context) => const HomeBaseScreen(),
          },
        ),
      ),
    );
  }
}

Map<int, Color> color = {
  50: const Color.fromRGBO(1, 19, 39, .1),
  100: const Color.fromRGBO(1, 19, 39, .2),
  200: const Color.fromRGBO(1, 19, 39, .3),
  300: const Color.fromRGBO(1, 19, 39, .4),
  400: const Color.fromRGBO(1, 19, 39, .5),
  500: const Color.fromRGBO(1, 19, 39, .6),
  600: const Color.fromRGBO(1, 19, 39, .7),
  700: const Color.fromRGBO(1, 19, 39, .8),
  800: const Color.fromRGBO(1, 19, 39, .9),
  900: const Color.fromRGBO(1, 19, 39, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF092544, color);

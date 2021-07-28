import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ueab/screens/index.dart';
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
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                centerTitle: true,
                // elevation: 0.0,
                textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
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
          home: SplashScreen(),
          routes: {
            IndexScreen.routeName: (context) => IndexScreen(),
          },
        ),
      ),
    );
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(1, 19, 39, .1),
  100: Color.fromRGBO(1, 19, 39, .2),
  200: Color.fromRGBO(1, 19, 39, .3),
  300: Color.fromRGBO(1, 19, 39, .4),
  400: Color.fromRGBO(1, 19, 39, .5),
  500: Color.fromRGBO(1, 19, 39, .6),
  600: Color.fromRGBO(1, 19, 39, .7),
  700: Color.fromRGBO(1, 19, 39, .8),
  800: Color.fromRGBO(1, 19, 39, .9),
  900: Color.fromRGBO(1, 19, 39, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF092544, color);

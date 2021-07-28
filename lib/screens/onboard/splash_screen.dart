import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ueab/screens/home/home_screen_base.dart';
import 'package:ueab/screens/index.dart';
import '../../providers/auth_provider.dart';
import 'dart:io' show Platform;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _checkIsNewUser() async {
    bool isNew =
        await Provider.of<AuthProvider>(context, listen: false).checkNewUser();
    Future.delayed(const Duration(seconds: 3), () async {
      if (isNew == true) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(IndexScreen.routeName, (route) => false);
      } else {
        bool isLoggedIn =
            await Provider.of<AuthProvider>(context, listen: false)
                .isUserLoggedIn();
        isLoggedIn
            ? Navigator.of(context).pushNamedAndRemoveUntil(
                HomeBaseScreen.routeName, (route) => false)
            : Navigator.of(context).pushNamedAndRemoveUntil(
                IndexScreen.routeName, (route) => false);
      }
    });
  }

  @override
  void initState() {
    _checkIsNewUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget body = Container(
      color: Theme.of(context).primaryColor,
      height: size.height,
      width: double.infinity,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 200,
        ),
      ),
    );
    return Platform.isAndroid
        ? Scaffold(body: body)
        : CupertinoPageScaffold(child: body);
  }
}

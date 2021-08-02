import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _iconWidget({required String iconPath, required String text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Material(
            color: Theme.of(context).primaryColor, // Button color
            child: InkWell(
              splashColor: Colors.blue[400], // Splash color

              onTap: () {},
              child: Container(
                width: 56,
                height: 56,
                child: Center(
                  child: new Image.asset(
                    iconPath,
                    color: Colors.white,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(fontSize: 13.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 250.0,
          width: double.infinity,
          color: Theme.of(context).primaryColor,
        ),
        Column(
          children: const [
            SizedBox(height: 100.0),
          ],
        ),
      ],
    );
  }
}

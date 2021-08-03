import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:percent_indicator/circular_percent_indicator.dart';

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
              child: SizedBox(
                width: 56,
                height: 56,
                child: Center(
                  child: Image.asset(
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
          style: const TextStyle(fontSize: 13.0),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: [
      const SizedBox(height: 100),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 180.0,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                          width: 130,
                          child: CircularPercentIndicator(
                            radius: 100.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 5.0,
                            percent: 0.5,
                            center: const Text(
                              "40",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: Colors.grey.shade200,
                            progressColor: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Days remaining',
                          style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome, Akilimali',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2nd Semenster',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text('Start : August, 3 '),
                          SizedBox(height: 5),
                          Text('End : November, 23 '),
                          SizedBox(height: 50),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const SizedBox(
          height: 180.0,
        ),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import '../../widgets/top_curve.dart';

class StudentsAffairsScreen extends StatefulWidget {
  const StudentsAffairsScreen({Key? key}) : super(key: key);

  @override
  _StudentsAffairsScreenState createState() => _StudentsAffairsScreenState();
}

class _StudentsAffairsScreenState extends State<StudentsAffairsScreen> {
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
        const SizedBox(height: 5),
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
    return SizedBox(
      height: size.height,
      child: Stack(children: [
        TopCurve(),
        Column(
          children: [
            const SizedBox(height: 120),
            const Icon(Icons.school, size: 70, color: Colors.white),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'STUDENT AFFAIRS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}

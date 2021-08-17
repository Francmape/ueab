import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:ueab/widgets/top_curve.dart';

class SchoolsScreen extends StatefulWidget {
  const SchoolsScreen({Key? key}) : super(key: key);

  @override
  _SchoolsScreenState createState() => _SchoolsScreenState();
}

class _SchoolsScreenState extends State<SchoolsScreen> {
  Widget _itemCard({required String text, required IconData iconData}) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 100.0,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  Icon(iconData,
                      color: Theme.of(context).primaryColor, size: 60),
                  const SizedBox(height: 10.0),
                  Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 40.0,
                width: 130.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        topLeft: Radius.circular(30.0)),
                    color: Theme.of(context).primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('More...',
                        style: TextStyle(color: Colors.amber.shade600)),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
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
            const Icon(Icons.apartment, size: 70, color: Colors.white),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'SCHOOLS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(8.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: [
                    InkWell(
                      child:
                          _itemCard(text: 'Business', iconData: Icons.business),
                      onTap: () {},
                    ),
                    InkWell(
                      child: _itemCard(text: 'E.H.S.S', iconData: Icons.class_),
                      onTap: () {},
                    ),
                    InkWell(
                      child: _itemCard(
                          text: 'Health Sc', iconData: Icons.science_rounded),
                      onTap: () {},
                    ),
                    InkWell(
                      child: _itemCard(
                          text: 'Nursing',
                          iconData: Icons.health_and_safety_rounded),
                      onTap: () {},
                    ),
                    InkWell(
                      child: _itemCard(
                          text: 'Science Tech', iconData: Icons.computer),
                      onTap: () {},
                    ),
                    InkWell(
                      child: _itemCard(
                          text: 'Postgraduate Studies',
                          iconData: Icons.school_rounded),
                      onTap: () {},
                    ),
                  ]),
            ),
          ],
        )
      ]),
    );
  }
}

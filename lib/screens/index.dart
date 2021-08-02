import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:ueab/authentication/login_screen.dart';
import 'package:ueab/widgets/card_event.dart';
import '../../widgets/card_home.dart';
import '../../utils/raw_data.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);
  static const routeName = '/index';

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget body = SingleChildScrollView(
        child: Container(
      // height: size.height,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const SizedBox(height: 120.0),
          Row(
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('MMMMEEEEd').format(DateTime.now()),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Text(
                    'Good Evening',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const SizedBox(height: 15.0),
                  ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: size.width * .30, height: 35),
                      child: ElevatedButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(LoginScreen.routeName),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Colors.grey.shade300),
                          child: const Text(
                            'Portal',
                            style: TextStyle(color: Colors.black),
                          ))),
                ],
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.receipt_long_rounded),
                  label: const Text('Fee structure')),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                    height: 30, child: VerticalDivider(color: Colors.black)),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.support_agent),
                  label: const Text('Enquiries'))
            ],
          ),
          const SizedBox(height: 10.0),
          Card(
            elevation: 2,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'University of Eastern Africa Baraton',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeData.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          UeabCard(ueab: homeData[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            children: const [
              SizedBox(width: 10.0),
              Text(
                'Events',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: eventData.length,
            itemBuilder: (context, index) => EventCard(event: eventData[index]),
          ),
        ],
      ),
    ));

    return Platform.isAndroid
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: false,
              title: const Text(
                'ueab',
                // style: TextStyle(color: Colors.black),
              ),
            ),
            body: body)
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: const Text(
                'Index',
                // style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: body);
  }
}

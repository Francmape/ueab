import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);
  static const routeName = '/index';

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    Widget body = Container();

    return Platform.isAndroid
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.white,
              centerTitle: false,
              title: const Text(
                'ueab',
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: body)
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: const Text(
                'Index',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
            child: body);
  }
}

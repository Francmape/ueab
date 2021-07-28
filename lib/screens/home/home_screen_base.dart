import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../screens/home/home_screen.dart';
import 'dart:io' show Platform;

class HomeBaseScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeBaseScreen({Key? key}) : super(key: key);

  @override
  _HomeBaseScreenState createState() => _HomeBaseScreenState();
}

class _HomeBaseScreenState extends State<HomeBaseScreen> {
  int _index = 0;
  String _title = '';

  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        print('Home');

        setState(() {
          _index = index;
        });
        break;
      case 1:
        print('Favorites');
        setState(() {
          _index = index;
          _title = 'Favorites';
        });
        break;
      case 2:
        print('Payments');
        setState(() {
          _index = index;
          _title = '';
        });
        break;

      case 3:
        print('Profile');
        // Navigator.of(context).pushNamed(ProfileScreen.routeName);

        break;
      default:
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      onTap: (int index) => _onItemTapped(index),
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined), label: 'Payments'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget body = screens[_index];
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    return Platform.isAndroid
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.vertical_distribute),
                onPressed: () {},
              ),
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: false,
              title: Text(
                _index == 0 ? 'Hello, ${authProvider.getUserName}' : _title,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            bottomNavigationBar: _bottomNavigationBar(),
            body: body)
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: IconButton(
                icon: Icon(Icons.vertical_distribute),
                onPressed: () {},
              ),
              middle: Text(
                'Hello, ${authProvider.getUserName}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
            ),
            child: body);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../screens/schools/schools_screen.dart';
import '../../screens/students_affairs/students_affairs_screen.dart';
import '../../screens/home/drawer_screen.dart';
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

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  List<Widget> screens = [
    const HomeScreen(),
    const SchoolsScreen(),
    const StudentsAffairsScreen(),
    const HomeScreen(),
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
        print('Schools');
        setState(() {
          _index = index;
          _title = 'Favorites';
        });
        break;
      case 2:
        print('Affairs');
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

  void _openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 150;
      scaleFactor = 0.6;
      isDrawerOpen = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: _index,
      onTap: (int index) => _onItemTapped(index),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.apartment), label: 'Schools'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Affairs'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: true);
    Widget body = Stack(
      children: [
        const DrawerScreen(),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isDrawerOpen ? 20 : 0),
            topRight: Radius.circular(isDrawerOpen ? 20 : 0),
          ),
          child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isDrawerOpen ? 20 : 0),
                      topLeft: Radius.circular(isDrawerOpen ? 20 : 0))),
              duration: const Duration(milliseconds: 250),
              transform: Matrix4.translationValues(xOffset, yOffset, 0)
                ..scale(scaleFactor),
              child: screens[_index]),
        )
      ],
    );
    return Platform.isAndroid
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: IconButton(
                icon: isDrawerOpen
                    ? const Icon(Icons.arrow_back)
                    : const Icon(Icons.vertical_distribute),
                onPressed: isDrawerOpen ? _closeDrawer : _openDrawer,
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: false,
            ),
            bottomNavigationBar: _bottomNavigationBar(),
            body: body)
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: IconButton(
                icon: const Icon(Icons.vertical_distribute),
                onPressed: _openDrawer,
              ),
              backgroundColor: Colors.transparent,
            ),
            child: body);
  }
}

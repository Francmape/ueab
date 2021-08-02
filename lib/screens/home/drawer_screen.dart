import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          const SizedBox(height: 200),
          ListTile(
              leading: const Icon(Icons.build_outlined, color: Colors.white),
              title: const Text('Departments',
                  style: TextStyle(color: Colors.white)),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.announcement, color: Colors.white),
              title: const Text('Annoucements',
                  style: TextStyle(color: Colors.white)),
              onTap: () {}),
          ListTile(
              leading:
                  const Icon(Icons.receipt_long_rounded, color: Colors.white),
              title:
                  const Text('Events', style: TextStyle(color: Colors.white)),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.library_books, color: Colors.white),
              title:
                  const Text('Library', style: TextStyle(color: Colors.white)),
              onTap: () {}),
          ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {}),
        ],
      ),
    );
  }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_flutter/logpage1.dart';
import 'package:loginpage_flutter/newpages/p1.dart';
import 'package:loginpage_flutter/newpages/p2.dart';
import 'package:loginpage_flutter/newpages/p3.dart';

class Nav extends StatefulWidget {
  @override
  State<Nav> createState() => _NavState();
}

/////////////////////////////////////navigator/////////////////////////////////////////////////////////
class _NavState extends State<Nav> {
  int _count = 0;
  final gang = [Log1(), p1(), p2(), p3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _count,
        onTap: ((value) {
          setState(() {
            _count = value;
          });
        }),
        items: [
          Icon(Icons.home),
          Icon(Icons.search_rounded),
          Icon(Icons.favorite),
          Icon(Icons.person),
        ],
        backgroundColor: Color.fromARGB(255, 255, 0, 140),
      ),
      body: gang[_count],
    );
  }
}

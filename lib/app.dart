import 'package:flutter/material.dart';
import 'package:loginpage_flutter/Loginpage.dart';
import 'package:loginpage_flutter/splash.dart';

final keyval = "login";

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ignore: prefer_const_constructors
      home: Scaffold(
        body: Splash(),
      ),
    );
  }
}

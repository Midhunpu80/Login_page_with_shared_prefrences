import 'package:flutter/material.dart';
import 'package:loginpage_flutter/Loginpage.dart';
import 'package:loginpage_flutter/app.dart';
import 'package:loginpage_flutter/logpage1.dart';
import 'package:loginpage_flutter/nav.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checklogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          color: Colors.black,
          child: Lottie.network(
              "https://assets1.lottiefiles.com/private_files/lf30_is6flrfu.json"),
        ),
      ),
    );
  }

  Future<void> game(BuildContext context) async {
    await Future.delayed(Duration(seconds: 7));
    /* var pref = await SharedPreferences.getInstance();
    if (await pref.setBool("login", true)) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Loginpage()));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Log1()));
    }
  }*/
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Loginpage()));
  }

/////////////////////////check login//////////////////////////////////////////////////////////
  Future<void> checklogin() async {
    final sharep = await SharedPreferences.getInstance();
    final loged = sharep.getBool(keyval);
    if (loged == null || loged == false) {
      game(context);
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Nav()));
    }
  }
}

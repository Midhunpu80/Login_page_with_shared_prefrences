// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_flutter/app.dart';
import 'package:loginpage_flutter/log2.dart';
import 'package:loginpage_flutter/logpage1.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _password = TextEditingController();

  final _username = TextEditingController();
  final _form = GlobalKey<FormState>();

  var b = true;

  get icon => null;

  var _obs = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          color: Color.fromARGB(255, 255, 255, 255),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  height: 800,
                  width: 1000,
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 300,
                          width: 1000,
                          color: Color.fromARGB(255, 255, 255, 255),

                          /// https://assets5.lottiefiles.com/packages/lf20_xlmz9xwm.json///
                          child: Lottie.network(
                              "https://assets5.lottiefiles.com/packages/lf20_xlmz9xwm.json"),
                        ),

                        SizedBox(
                          height: 70,
                        ),
                        ////////username//////////////////////////////////////////////////////////////
                        TextFormField(
                            autofillHints: [AutofillHints.oneTimeCode],
                            controller: _username,
                            decoration: const InputDecoration(
                                hintText: "Enter your Username",
                                prefixIcon: Icon(Icons.person),
                                labelText: "Enter the username ",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.pink))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "is error ";
                              } else if (value.length < 6) {
                                return "pls enter minimum 6 charecter";
                              } else {
                                return null;
                              }
                            }),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 20,
                        ),
                        ////-----------------------------------------------------------------------------------------///
                        /////////////////text form field ///////////////   and validation /////////////////////////////
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _password,
                          obscureText: _obs,
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              enabled: true,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                onPressed: () => setState(() {
                                  _obs = !_obs;

                                  b = !b;
                                }),
                                icon: b
                                    ? const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.pink,
                                      )
                                    : const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Color.fromARGB(255, 0, 72, 255),
                                      ),
                              ),
                              iconColor: Colors.pink,
                              labelText: "Enter the password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 4, color: Colors.pink))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "is error ";
                            } else if (value.length < 6) {
                              return "pls enter minimum 6 Numbers ";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        ///////button ////////////////////////////////////////////
                        Positioned(
                          left: 200,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (_form.currentState!.validate()) {
                                Action(context);
                              } else {
                                return null;
                              }
                            },
                            label: Text("Login"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink),
                            icon: Icon(Icons.login_outlined),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

/////////////////////////////////////////////////////////////////////////////////
  // ignore: non_constant_identifier_names
  Future<void> Action(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    var pass = _password.text;
    var user = _username.text;
    if (user == "midhunpu80@gmail.com" && pass == "123456") {
      final sharep = await SharedPreferences.getInstance();
      await sharep.setBool(keyval, true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Log1()));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                content: Text(
                  "Incorrect password and username ",
                  style: TextStyle(color: Color.fromARGB(255, 255, 102, 0)),
                ),
                title: Text(
                  "Error",
                  style: TextStyle(color: Color.fromARGB(255, 255, 17, 0)),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "return",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ));
    }
  }
}

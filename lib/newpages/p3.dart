import 'package:flutter/material.dart';

class p3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 208, 0, 255),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: 600,
                  color: Colors.blue,
                ),
                Container(
                  height: 300,
                  width: 200,
                  color: Color.fromARGB(255, 243, 0, 247),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

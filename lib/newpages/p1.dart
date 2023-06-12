import 'dart:io';

import 'package:flutter/material.dart';

class p1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 700,
                      width: 500,
                      color: Color.fromARGB(255, 0, 255, 4),
                      child: Column(
                        children: [
                          cont2(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class cont2 extends StatelessWidget {
  const cont2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              height: 90,
              width: 900,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

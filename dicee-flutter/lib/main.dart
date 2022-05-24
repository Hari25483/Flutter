import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dicenumber = 5;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
                  onPressed: () {
                    print("Left button got pressed");
                  },
                  child: Image.asset('images/dice$dicenumber.png'))),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    print("Right button got pressed");
                  },
                  child: Image.asset('images/dice$dicenumber .png')))
        ],
      ),
    );
  }
}

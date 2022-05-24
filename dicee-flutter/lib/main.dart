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

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Widget build(BuildContext context) {
    var dicenumber = 5;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      dicenumber = 5;
                      print("Left button got pressed");
                    });
                  },
                  child: Image.asset('images/dice$dicenumber.png'))),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      dicenumber = 5;
                      print("Left button got pressed");
                    });
                  },
                  child: Image.asset('images/dice$dicenumber.png')))
        ],
      ),
    );
  }
}

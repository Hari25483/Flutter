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
  int leftdicenumber = 5;
  int rightdicenumber = 0;
  void changeDiceFace() {
    leftdicenumber = Random().nextInt(6) + 1;
    rightdicenumber = Random().nextInt(6) + 1;
  }

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                      // leftdicenumber = Random().nextInt(6) + 1;
                      // print("Left button got pressed $leftdicenumber");
                    });
                  },
                  child: Image.asset('images/dice$leftdicenumber.png'))),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeDiceFace();
                      // rightdicenumber = Random().nextInt(6) + 1;
                      // print("Right button got pressed $rightdicenumber");
                    });
                  },
                  child: Image.asset('images/dice$rightdicenumber.png')))
        ],
      ),
    );
  }
}

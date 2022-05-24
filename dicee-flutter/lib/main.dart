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
  int dicenumber = 5;
  int rightdicenumber = 0;

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      dicenumber = Random().nextInt(6) + 1;
                      print("Left button got pressed $dicenumber");
                    });
                  },
                  child: Image.asset('images/dice$dicenumber.png'))),
          Expanded(
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      rightdicenumber = Random().nextInt(6) + 1;
                      print("Right button got pressed $rightdicenumber");
                    });
                  },
                  child: Image.asset('images/dice$rightdicenumber.png')))
        ],
      ),
    );
  }
}

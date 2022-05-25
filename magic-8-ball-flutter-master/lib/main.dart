import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade500,
        appBar: AppBar(
          title: Text("Ask Me Anything"),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Magic_Ball(),
      ),
    ),
  );
}

class Magic_Ball extends StatefulWidget {
  const Magic_Ball({Key? key}) : super(key: key);

  @override
  State<Magic_Ball> createState() => _Magic_BallState();
}

class _Magic_BallState extends State<Magic_Ball> {
  @override
  int ballnumber = 1;
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            ballnumber = Random().nextInt(6) + 1;
            print(ballnumber);
          },
          child: Image.asset("images/ball1.png")),
    );
  }
}

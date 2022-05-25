import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("images/ball1.png"),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage(
                  "images/270042121_4518560931604207_3691290218835539511_n.jpeg"),
            ),
            Text(
              'Hariharan Raveenthiran',
              style: TextStyle(
                fontSize: 40.00,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal[100],
                  fontSize: 25.00,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }
}

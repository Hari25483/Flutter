import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Image(
              image: AssetImage("images/MIT-Metallic-Diamond-01-Press.jpeg")
              // image: NetworkImage('https://wallpaperaccess.com/full/6905324.jpg'),

              ),
        ),
      ),
    ),
  );
}

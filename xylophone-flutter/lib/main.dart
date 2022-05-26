import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note1.wav');
                    },
                    child: Text('Click me!')),
                FlatButton(
                    color: Colors.amber,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note2.wav');
                    },
                    child: Text('Click me!')),
                FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note3.wav');
                    },
                    child: Text('Click me!')),
                FlatButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note4.wav');
                    },
                    child: Text('Click me!')),
                FlatButton(
                    color: Colors.cyan,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note5.wav');
                    },
                    child: Text('Click me!')),
                FlatButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note6.wav');
                    },
                    child: Text('Click me!')),
                FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      final player = AudioCache();

                      player.play('note7.wav');
                    },
                    child: Text('Click me!')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

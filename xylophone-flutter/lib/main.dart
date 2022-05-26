import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

void playsound(int clipno) {
  final player = AudioCache();
  player.play('note$clipno.wav');
}

Expanded buildkey(Color color, int soundno) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(backgroundColor: color),
      onPressed: () {
        playsound(1);
        final player = AudioCache();
        player.play('note$soundno.wav');
      },
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildkey(Colors.red, 1),
                buildkey(Colors.amber, 2),
                buildkey(Colors.blue, 3),
                buildkey(Colors.orangeAccent, 4),
                buildkey(Colors.cyan, 5),
                buildkey(Colors.deepPurpleAccent, 6),
                buildkey(Colors.green, 7)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

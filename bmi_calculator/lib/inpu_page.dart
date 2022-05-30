import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(colour: Color(0xFF1D1E33)),
                ),
                Expanded(child: Reusablewidget(colour: Color(0xFF1D1E33)))
              ],
            )),
            Expanded(
              child: Reusablewidget(colour: Color(0xFF1D1E33)),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(colour: Color(0xFF1D1E33)),
                ),
                Expanded(
                  child: Reusablewidget(
                    colour: Color(0xFF1D1E33),
                  ),
                )
              ],
            ))
          ],
        ));
  }
}

class Reusablewidget extends StatelessWidget {
  Reusablewidget({required this.colour});
  Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
    );
  }
}

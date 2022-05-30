import 'package:flutter/material.dart';

const bottomContainerHeight = 80.00;
const reusableWidgetColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

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
                  child: Reusablewidget(colour: reusableWidgetColor),
                ),
                Expanded(child: Reusablewidget(colour: reusableWidgetColor))
              ],
            )),
            Expanded(
              child: Reusablewidget(colour: reusableWidgetColor),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(colour: reusableWidgetColor),
                ),
                Expanded(
                  child: Reusablewidget(
                    colour: reusableWidgetColor,
                  ),
                )
              ],
            )),
            Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: bottomContainerHeight,
            )
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

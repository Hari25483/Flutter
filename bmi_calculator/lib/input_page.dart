import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableWidget.dart';
import 'package:bmi_calculator/IconWidget.dart';

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
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(
                    colour: reusableWidgetColor,
                    cardChild:
                        IconWidget(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                    child: Reusablewidget(
                        cardChild: IconWidget(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                        colour: reusableWidgetColor))
              ],
            )),
            Expanded(
              child: Reusablewidget(
                  cardChild: Column(), colour: reusableWidgetColor),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(
                      cardChild: Column(), colour: reusableWidgetColor),
                ),
                Expanded(
                  child: Reusablewidget(
                    cardChild: Column(),
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

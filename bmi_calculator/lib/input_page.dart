import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableWidget.dart';
import 'package:bmi_calculator/IconWidget.dart';

enum Gender { male, female, nothing }

const bottomContainerHeight = 80.00;
const activeWidgetColor = Color(0xFF1D1E33);
const inactiveWidgetColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColor = inactiveWidgetColor;
  Color femaleCardColor = inactiveWidgetColor;
  Gender selectedGender = Gender.nothing;

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                        print("Male card was pressed!");
                      });
                    },
                    child: Reusablewidget(
                      colour: selectedGender == Gender.male
                          ? activeWidgetColor
                          : inactiveWidgetColor,
                      cardChild: IconWidget(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                      print("Female card was pressed!");
                    });
                  },
                  child: Reusablewidget(
                      cardChild: IconWidget(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      colour: selectedGender == Gender.female
                          ? activeWidgetColor
                          : inactiveWidgetColor),
                ))
              ],
            )),
            Expanded(
              child: Reusablewidget(
                  cardChild: Container(), colour: activeWidgetColor),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(
                      cardChild: Column(), colour: activeWidgetColor),
                ),
                Expanded(
                  child: Reusablewidget(
                    cardChild: Column(),
                    colour: activeWidgetColor,
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

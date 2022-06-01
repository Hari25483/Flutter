import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableWidget.dart';
import 'package:bmi_calculator/IconWidget.dart';
import 'constants.dart';

int height = 180;

enum Gender { male, female, nothing }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColor = kinactiveWidgetColor;
  Color femaleCardColor = kinactiveWidgetColor;
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
                            ? kactiveWidgetColor
                            : kinactiveWidgetColor,
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
                            ? kactiveWidgetColor
                            : kinactiveWidgetColor),
                  ))
                ],
              ),
            ),
            Expanded(
              child: Reusablewidget(
                cardChild: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: LabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: knumberTextStyle),
                        Text('cm', style: LabelTextStyle)
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      inactiveColor: Color(0xFF8D8E98),
                      activeColor: Color(0xFFEB1555),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print(newValue);
                      },
                    )
                  ],
                ),
                colour: kactiveWidgetColor,
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reusablewidget(
                      cardChild: Column(), colour: kactiveWidgetColor),
                ),
                Expanded(
                  child: Reusablewidget(
                    cardChild: Column(),
                    colour: kactiveWidgetColor,
                  ),
                )
              ],
            )),
            Container(
              color: kbottomContainerColor,
              width: double.infinity,
              height: kbottomContainerHeight,
            )
          ],
        ));
  }
}

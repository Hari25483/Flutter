import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ReusableWidget.dart';
import 'package:bmi_calculator/IconWidget.dart';
import 'constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'calculator_brain.dart';

int height = 180;
int weight = 60;
int age = 20;

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.00),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.00),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                        print(newValue);
                      },
                    ),
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
                    colour: kactiveWidgetColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: LabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  print(weight);
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                  print(weight);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusablewidget(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: LabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: knumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                  // print(weight);
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                  // print(weight);
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kactiveWidgetColor,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculator_brain calc =
                  new calculator_brain(weight: weight, height: height);
              String result = calc.calulateBMI();
              String resultText = calc.getResult();
              String interpretation = calc.getInterpretation();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Results_page(
                            resultText: resultText,
                            Result: result,
                            interpretation: interpretation,
                          )));
            },
            child: Container(
              child: Center(
                  child: Text(
                'CALCULATE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              )),
              color: kbottomContainerColor,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.00),
              height: kbottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed()});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.00, height: 56.00),
      onPressed: null,
      child: Icon(icon),
    );
  }
}

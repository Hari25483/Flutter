import 'package:bmi_calculator/ReusableWidget.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculator_brain.dart';

class Results_page extends StatelessWidget {
  Results_page(
      {required this.interpretation,
      required this.Result,
      required this.resultText});
  final String Result;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablewidget(
              colour: kactiveWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Result,
                    style: kResultTextStyle,
                  ),
                  Text(
                    resultText.toUpperCase(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'RE-CALCULATE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              )),
              color: kbottomContainerColor,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.00),
              height: kbottomContainerHeight,
            ),
          )
        ],
      ),
    );
  }
}

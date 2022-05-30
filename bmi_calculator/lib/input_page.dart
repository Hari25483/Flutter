import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    cardChild: IconWidget(),
                  ),
                ),
                Expanded(
                    child: Reusablewidget(
                        cardChild: Column(), colour: reusableWidgetColor))
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

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Icon(
          FontAwesomeIcons.mars,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          'MALE',
          style: TextStyle(
            fontSize: 18.00,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

class Reusablewidget extends StatelessWidget {
  const Reusablewidget({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
      child: cardChild,
    );
  }
}

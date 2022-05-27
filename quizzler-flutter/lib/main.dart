import 'package:flutter/material.dart';
import 'package:quizzler/question.dart';
import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Scorekeeper = [];
  // List<String> Questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  List<Question> questionbank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true)
  ];

  int question_no = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionbank[question_no].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctanswer = questionbank[question_no].answer;

                setState(() {
                  if (correctanswer == true) {
                    print("Your answer is correct");
                    Scorekeeper.add(Icon(Icons.check, color: Colors.green));
                  } else {
                    print("Your answer is false");
                    Scorekeeper.add(Icon(Icons.close, color: Colors.red));
                  }

                  question_no++;
                  //The user picked true.
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctanswer = questionbank[question_no].answer;
                setState(() {
                  if (correctanswer == false) {
                    print("Your answer is correct");
                    Scorekeeper.add(Icon(Icons.close, color: Colors.red));
                  } else {
                    print("Your answer is false");
                    Scorekeeper.add(Icon(Icons.check, color: Colors.green));
                  }

                  question_no++;
                });
                //The user picked false.
              },
            ),
          ),
        ),

        Row(
          children: Scorekeeper,
        ),

        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*

*/
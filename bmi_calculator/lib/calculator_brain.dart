import 'dart:math';

class calculator_brain {
  calculator_brain({required this.weight, required this.height});

  final int height;
  final int weight;

  double _bmi = 0;

  String calulateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You have a higher body weight than normal. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job.';
    } else {
      return 'You have a lower body weight than normal. You can eat a bit more.';
    }
  }
}

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BmiPeovider extends ChangeNotifier {


  double _bmi = 0.0;
  String get bmi => _bmi.toStringAsFixed(1);

  final bmiSTUTAsMap = {
    underweightSeverethinness: 'less then 16.0',
    underweightModeratethinness: '16.0 - 16.9',
    underweightMildthinness: '17.0 - 18.4',
    NormalRange: '18.5 - 24.9',
    OverweightPreobese: '25.0 - 29.9',
    ClassOne: '30.0 - 34.4',
    ClassTwo: '35.0 - 39.9',
    ClassThree: '40.0 and up'
  };


  void calculateBmi(String w, String h) {

    final weight = double.parse(w);
    final height = double.parse(h);
    _bmi = weight / (height * height);
    notifyListeners();


  }


  String getBmiStutas() {
    if (_bmi < 16) return underweightSeverethinness;
    if (_bmi >= 16.0 && _bmi <= 16.9) return underweightModeratethinness;
    if (_bmi >= 17.0 && _bmi <= 18.4) return underweightMildthinness;
    if (_bmi >= 18.5 && _bmi <= 24.9) return NormalRange;
    if (_bmi >= 25.0 && _bmi <= 29.9) return OverweightPreobese;
    if (_bmi >= 30.0 && _bmi <= 34.9) return ClassOne;
    if (_bmi >= 35.0 && _bmi <= 39.9) return ClassTwo;
    return ClassThree;
    notifyListeners();
  }
  Color? getTileColor(String stutas){
    if(getBmiStutas() == stutas) {
      if(stutas == underweightSeverethinness) return Colors.red;
      if(stutas == underweightModeratethinness) return Colors.red[400];
      if(stutas == underweightMildthinness) return Colors.red[200];
      if(stutas == NormalRange) return Colors.green;
      if(stutas == OverweightPreobese) return Colors.green[400];
      if(stutas == ClassOne) return Colors.green[300];
      if(stutas == ClassTwo) return Colors.yellowAccent;
      return Colors.red;
    }
    return null;
    notifyListeners();
  }

  static const underweightSeverethinness = 'Underweight \n(Severe thinness)';
  static const underweightModeratethinness = 'Underweight \n(Moderate thinness)';
  static const underweightMildthinness = 'Underweight \n(Mild thinness)';
  static const NormalRange = 'Normal';
  static const OverweightPreobese = 'Overweight \n(Pre-obese)';
  static const ClassOne = 'Obese \n(Class I)';
  static const ClassTwo = 'Obese \n(Class II)';
  static const ClassThree = 'Obese \n(Class III)';

}